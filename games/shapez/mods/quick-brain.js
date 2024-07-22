// @ts-nocheck
const METADATA = {
    website: "",
    author: "PapaFlyn",
    name: "Quick Brain",
    version: "1.0.0",
    id: "quick-brain",
    description: "In-game Calculator like in Satisfactory",
    minimumGameVersion: ">=1.5.0",
    doesNotAffectSavegame: true
};

class Mod extends shapez.Mod {
    init() {
        this.modInterface.registerTranslations("en", {
            mods: {
                quickbrain: {
                    toggleCalculator: "Enable calculator",
                },
            },
        });

        this.modInterface.registerTranslations("ru", {
            mods: {
                quickbrain: {
                    toggleCalculator: "Открыть калькулятор",
                },
            },
        });

        this.modInterface.registerCss(`
			.hidden {
				visibility: hidden;
				display: none;
			}

			#quickBrainOverlay {
				--input-width: 270px;
				--input-height: 40px;
				position: absolute;
				top: 50%;
				left: 50%;
				transform: translate(calc(var(--input-width)/2*-1), calc(var(--input-height)/2*-1));
				z-index: 1000;
				display: none; /* Initially hidden */
			}

			#quickBrainTitle {
				margin: 0 0 -10px 5px;
				padding: 0;
				font-size: 14px;
				color: white;
			}

			#quickBrainInputHandle {
				height: 100%;
				width: 100%;
				background-color: #2d2d2d;
			}

			#quickBrainInput {
			    margin: 0;
			    padding: 0;
				width: 100%;
				margin-left: 5px;
				height: var(--input-height);
				font-size: 18px;
				background-color: #2d2d2d;
				border: none;
				color: #dcdcdc;
				box-sizing: border-box;
			}

			#quickBrainInput:focus {
				outline: none;
			}

			#quickBrainResultDropdown {
				width: 100%;
				height: 30px;
				background-color: rgba(0, 0, 0, .65);
				align-items: center;
			}

			#quickBrainResult {
				position: relative;
				top: 50%;
				transform: translate(0, -50%);
				width: calc(100% - 5px);
				margin-left: 5px;
				font-size: 15px;
				border: none;
				color: #dcdcdc;
			}

			#quickBrainOverlay > div {
				display: flex;
				align-items: center;
			}

			#closeButton {
				background-color: #444;
				width: var(--input-height);
				height: var(--input-height);
				border: none;
				color: white;
				padding: 10px 15px;
				text-align: center;
				text-decoration: none;
				display: inline-block;
				font-size: 16px;
				cursor: pointer;
			}
		`);

        this.modInterface.registerIngameKeybinding({
            id: "quickBrainToggle",
            keyCode: shapez.keyToKeyCode("E"),
            translation: "Toggle Quick Brain",
            modifiers: {
                ctrl: true
            },
            handler: root => {
                this.toggleCalculator();
                return shapez.STOP_PROPAGATION;
            }
        });

        this.signals.stateEntered.add(state => {
            if (state.key === "InGameState") {
                this.createCalculatorOverlay();
            }
        });

        this.active = false;

        this.modInterface.runAfterMethod(shapez.HUDKeybindingOverlay, "createElements", function () {
            const DIVIDER_TOKEN = "/";
            const ADDER_TOKEN = "+";
            function getHandleHTML(root, handle) {
                let html = ""

                for (let k = 0; k < handle.keys.length; ++k) {
                    const key = handle.keys[k];

                    switch (key) {
                        case shapez.KEYCODE_LMB:
                            html += `<code class="keybinding leftMouse"></code>`;
                            break;
                        case shapez.KEYCODE_RMB:
                            html += `<code class="keybinding rightMouse"></code>`;
                            break;
                        case shapez.KEYCODE_MMB:
                            html += `<code class="keybinding middleMouse"></code>`;
                            break;
                        case shapez.KEYCODES.Ctrl:
                            html += `<code class="keybinding">CTRL</code>`;
                            break;
                        case DIVIDER_TOKEN:
                            html += `<i></i>`;
                            break;
                        case ADDER_TOKEN:
                            html += `+`;
                            break;
                        default:
                            html += `<code class="keybinding">${shapez.getStringForKeyCode(
                                root.keyMapper.getBinding(key).keyCode
                            )}</code>`;
                    }
                }
                html += `<label>${handle.label}</label>`;
                return html
            }

            let handle = {
                label: shapez.T.mods.quickbrain.toggleCalculator,
                keys: [shapez.KEYCODES.Ctrl, ADDER_TOKEN, shapez.KEYMAPPINGS.mods.quickBrainToggle],
                condition: () => !this.anyPlacementActive,
                cachedVisibility: true,
                cachedElement: null
            }

            handle.cachedElement = shapez.makeDiv(this.element,
                null, ["binding"], getHandleHTML(this.root, handle));
            handle.cachedElement.classList.toggle("visible", true);

            this.keybindings.push(handle);
        });

        this.signals.gameInitialized.add(root => {
            this.inputManager = root.app.inputMgr;
            this.inputReciever = new shapez.InputReceiver("quick-brain");

            this.keyActionMapper = new shapez.KeyActionMapper(root, this.inputReciever);
            this.keyActionMapper.getBinding(shapez.KEYMAPPINGS.general.back).add(this.toggleCalculator, this);
            this.keyActionMapper.getBinding(shapez.KEYMAPPINGS.mods.quickBrainToggle).add(this.toggleCalculator, this);
        })
    }

    createCalculatorOverlay() {
        const element = document.createElement("div");
        element.id = "quickBrainOverlay";
        element.style = "display: none"

        const title = document.createElement("p");
        title.id = "quickBrainTitle";
        title.textContent = "Quick Brain";
        element.appendChild(title);

        const inputHandle = document.createElement("div");
        inputHandle.id = "quickBrainInputHandle";
        element.appendChild(inputHandle);

        const input = document.createElement("input");
        input.id = "quickBrainInput";
        input.type = "text";
        input.placeholder = "Calculate";
        inputHandle.appendChild(input);

        const closeButton = document.createElement("button");
        closeButton.id = "closeButton";
        closeButton.textContent = "X";
        inputHandle.appendChild(closeButton);

        const resultContainer = document.createElement("div");
        element.appendChild(resultContainer);

        const resultDropdown = document.createElement("div");
        resultDropdown.id = "quickBrainResultDropdown";
        resultDropdown.classList.add("hidden");
        resultContainer.appendChild(resultDropdown);

        const result = document.createElement("div");
        result.id = "quickBrainResult";
        resultDropdown.appendChild(result);

        document.body.appendChild(element);

        input.addEventListener("input", () => {
            this.updateCalculatorResult(input, result, resultDropdown);
        });
        closeButton.addEventListener("click", () => {
            this.toggleCalculator();
        });
    }

    toggleCalculator() {
        const overlay = document.getElementById("quickBrainOverlay");
        const input = document.getElementById("quickBrainInput");

        if (this.active) {
            overlay.style.display = "none"
            this.inputManager.makeSureDetached(this.inputReciever);
        } else {
            overlay.style.display = "block"
            this.inputManager.makeSureAttachedAndOnTop(this.inputReciever);
            input.focus();
        }

        this.active = !this.active;

        this.updateCalculatorResult(input, document.getElementById("quickBrainResult"), document.getElementById("quickBrainResultDropdown"));
    }


    roundNumber(number, places) {
        return parseFloat(number.toFixed(places));
    }

    setResultVisibility(resultDropdown, state) {
        if (state && !resultDropdown.classList.contains("hidden")) {
            return;
        }
        if (state) {
            resultDropdown.classList.remove("hidden")
        } else {
            resultDropdown.classList.add("hidden")
        }
    }


    processExpression(expression) {
        const result = eval(expression.replaceAll("^", "**").replaceAll(",", "."));
        if (result > 2147483647) { return "inf"; }
        return this.roundNumber(result, 5).toString();
    }


    updateCalculatorResult(input, result, resultDropdown) {
        let evaluationResult = "=";
        try {
            const expression = input.value;
            if (!expression) {
                this.setResultVisibility(resultDropdown, false);
            } else {
                this.setResultVisibility(resultDropdown, true);
            }
            evaluationResult += this.processExpression(expression);
        } catch (error) {
            evaluationResult += "?";
        }
        result.textContent = evaluationResult;
    }
}