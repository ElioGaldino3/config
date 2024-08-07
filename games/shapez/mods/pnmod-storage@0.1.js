// @ts-nocheck
const METADATA = {
    website: "https://mod.io/g/shapez/u/peignenappe",
    author: "peignenappe",
    name: "Pnmod Micro Storage",
    version: "0.1",
    id: "pnmod-storage",
    description: "Adds a tiny storage building.",
    minimumGameVersion: ">=1.5.0",
    modId: "2932914",
};

class Mod extends shapez.Mod {
    init() {
        
        if (!shapez.enumStorageVariants)
			shapez.enumStorageVariants = new Object;
		shapez.enumStorageVariants.pnmod_micro = "pnmod_micro";

		const MAX_STORAGE = 100;

        // ADD MICRO FILTER LEFT

        this.modInterface.addVariantToExistingBuilding(
            shapez.MetaStorageBuilding,
            shapez.enumStorageVariants.pnmod_micro,
            {
                name: "Micro Storage",
                description: "A 1x1 storage, low capacity.",

                tutorialImageBase64: RESOURCES["storage-micro.png"],
                regularSpriteBase64: RESOURCES["storage-micro.png"],
                blueprintSpriteBase64: RESOURCES["storage-micro.png"],

                dimensions: new shapez.Vector(1, 1),

                additionalStatistics(root) {
					return [[
						shapez.T.ingame.buildingPlacement.infoTexts.storage,
						shapez.formatBigNumber(MAX_STORAGE)
					]];
				},

				isUnlocked(root) {
					return root.hubGoals.isRewardUnlocked(shapez.enumHubGoalRewards.reward_storage);
				},

            }
        );

        this.modInterface.extendClass(shapez.MetaStorageBuilding, ({$old}) => ({
			updateVariants(entity, rotationVariant, variant) {
				var top = shapez.enumDirection.top;
				var bottom = shapez.enumDirection.bottom;
				entity.components.Storage.root = entity.root;
				if (variant === "pnmod_micro") {
					entity.components.ItemEjector.setSlots([
						{ pos: new shapez.Vector(0, 0), direction: top},
					]);
					entity.components.ItemAcceptor.setSlots([
						{ pos: new shapez.Vector(0, 0), direction: bottom },
					]);
					entity.components.WiredPins.setSlots([
						{ pos: new shapez.Vector(0,0), direction: shapez.enumDirection.right, type: shapez.enumPinSlotType.logicalEjector },
						{ pos: new shapez.Vector(0,0), direction: shapez.enumDirection.left, type: shapez.enumPinSlotType.logicalEjector },
					]);
					if (!entity.components.BeltUnderlays)
					entity.addComponent(new shapez.BeltUnderlaysComponent({ underlays: [
						{ pos: new shapez.Vector(0, 0), direction: shapez.enumDirection.top },
                    ]}));
                    entity.components.Storage.maximumStorage = MAX_STORAGE;
					entity.components.Storage.isMicro = true;
				} else {
					entity.components.ItemEjector.setSlots([
						{ pos: new shapez.Vector(0, 0), direction: top },
						{ pos: new shapez.Vector(1, 0), direction: top },
					]);
                    entity.components.ItemAcceptor.setSlots([
						{ pos: new shapez.Vector(0, 1), direction: bottom },
						{ pos: new shapez.Vector(1, 1), direction: bottom },
					]);
					entity.components.WiredPins.setSlots([
						{ pos: new shapez.Vector(1, 1), direction: shapez.enumDirection.right, type: shapez.enumPinSlotType.logicalEjector },
						{ pos: new shapez.Vector(0, 1), direction: shapez.enumDirection.left, type: shapez.enumPinSlotType.logicalEjector },
					]);
					$old.updateVariants.bind(this)(
						entity,
						rotationVariant,
						variant
					);
				}
			},
		}));

		this.modInterface.extendClass(shapez.StorageSystem, ({ $super, $old }) => ({
			drawChunk(parameters, chunk) {
					const contents = chunk.containedEntitiesByLayer.regular;
					for (let i = 0; i < contents.length; ++i) {
						const entity = contents[i];
						const storageComp = entity.components.Storage;
						
						if (!storageComp) {
							continue;
						}
						
						const storedItem = storageComp.storedItem;
						if (!storedItem) {
							continue;
						}
			
						if (this.drawnUids.has(entity.uid)) {
							continue;
						}
			
						this.drawnUids.add(entity.uid);
			
						const staticComp = entity.components.StaticMapEntity;
			
						const context = parameters.context;
						context.globalAlpha = storageComp.overlayOpacity;
						const center = staticComp.getTileSpaceBounds().getCenter().toWorldSpace();

						if (storageComp.isMicro) {

							storedItem.drawItemCenteredClipped(center.x, center.y, parameters, 15);
							this.storageOverlaySprite.drawCached(parameters, center.x - 8, center.y + 5, 16, 10);
				
							if (parameters.visibleRect.containsCircle(center.x, center.y + 10, 20)) {
								context.font = "bold 8px GameFont";
								context.textAlign = "center";
								context.fillStyle = "#64666e";
								context.fillText(shapez.formatBigNumber(storageComp.storedCount), center.x, center.y + 12.3);
								context.textAlign = "left";
							}

						} else {

							storedItem.drawItemCenteredClipped(center.x, center.y, parameters, 30);
							this.storageOverlaySprite.drawCached(parameters, center.x - 15, center.y + 15, 30, 15);
				
							if (parameters.visibleRect.containsCircle(center.x, center.y + 25, 20)) {
								context.font = "bold 10px GameFont";
								context.textAlign = "center";
								context.fillStyle = "#64666e";
								context.fillText(shapez.formatBigNumber(storageComp.storedCount), center.x, center.y + 25.5);
								context.textAlign = "left";
							}

						}

						context.globalAlpha = 1;
					}
			}
		}));
    }
}

const RESOURCES = {
    "storage-micro.png":
        "data:image/png;base64, iVBORw0KGgoAAAANSUhEUgAAAMAAAADACAYAAABS3GwHAAAACXBIWXMAAAsTAAALEwEAmpwYAAANu2lUWHRYTUw6Y29tLmFkb2JlLnhtcAAAAAAAPD94cGFja2V0IGJlZ2luPSLvu78iIGlkPSJXNU0wTXBDZWhpSHpyZVN6TlRjemtjOWQiPz4gPHg6eG1wbWV0YSB4bWxuczp4PSJhZG9iZTpuczptZXRhLyIgeDp4bXB0az0iQWRvYmUgWE1QIENvcmUgNy4xLWMwMDAgNzkuZWRhMmIzZiwgMjAyMS8xMS8xNC0xMjozMDo0MiAgICAgICAgIj4gPHJkZjpSREYgeG1sbnM6cmRmPSJodHRwOi8vd3d3LnczLm9yZy8xOTk5LzAyLzIyLXJkZi1zeW50YXgtbnMjIj4gPHJkZjpEZXNjcmlwdGlvbiByZGY6YWJvdXQ9IiIgeG1sbnM6eG1wPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvIiB4bWxuczpkYz0iaHR0cDovL3B1cmwub3JnL2RjL2VsZW1lbnRzLzEuMS8iIHhtbG5zOnhtcE1NPSJodHRwOi8vbnMuYWRvYmUuY29tL3hhcC8xLjAvbW0vIiB4bWxuczpzdEV2dD0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlRXZlbnQjIiB4bWxuczpzdFJlZj0iaHR0cDovL25zLmFkb2JlLmNvbS94YXAvMS4wL3NUeXBlL1Jlc291cmNlUmVmIyIgeG1sbnM6cGhvdG9zaG9wPSJodHRwOi8vbnMuYWRvYmUuY29tL3Bob3Rvc2hvcC8xLjAvIiB4bWxuczp0aWZmPSJodHRwOi8vbnMuYWRvYmUuY29tL3RpZmYvMS4wLyIgeG1sbnM6ZXhpZj0iaHR0cDovL25zLmFkb2JlLmNvbS9leGlmLzEuMC8iIHhtcDpDcmVhdG9yVG9vbD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTkgKFdpbmRvd3MpIiB4bXA6Q3JlYXRlRGF0ZT0iMjAyMC0wNC0xN1QwOTo0ODo1OSswMjowMCIgeG1wOk1ldGFkYXRhRGF0ZT0iMjAyMy0wMy0yMVQxMDoxNToxNyswMTowMCIgeG1wOk1vZGlmeURhdGU9IjIwMjMtMDMtMjFUMTA6MTU6MTcrMDE6MDAiIGRjOmZvcm1hdD0iaW1hZ2UvcG5nIiB4bXBNTTpJbnN0YW5jZUlEPSJ4bXAuaWlkOjE0Y2YxZWMwLWM1ZGMtMWU0MS05ODcwLWEwNzM3NmMzMzUyNiIgeG1wTU06RG9jdW1lbnRJRD0iYWRvYmU6ZG9jaWQ6cGhvdG9zaG9wOmExMTA5OTVjLWUwNTAtNDA0NC04OTA0LTNkNmMxYTU2OTU0MSIgeG1wTU06T3JpZ2luYWxEb2N1bWVudElEPSJ4bXAuZGlkOjRkMGU2OTJmLTk0ZTctNDA0Mi1hY2NiLTZlNzhhMzBlNTdmYyIgcGhvdG9zaG9wOkNvbG9yTW9kZT0iMyIgdGlmZjpPcmllbnRhdGlvbj0iMSIgdGlmZjpYUmVzb2x1dGlvbj0iNzIwMDAwLzEwMDAwIiB0aWZmOllSZXNvbHV0aW9uPSI3MjAwMDAvMTAwMDAiIHRpZmY6UmVzb2x1dGlvblVuaXQ9IjIiIGV4aWY6Q29sb3JTcGFjZT0iNjU1MzUiIGV4aWY6UGl4ZWxYRGltZW5zaW9uPSIxOTIiIGV4aWY6UGl4ZWxZRGltZW5zaW9uPSIxOTIiPiA8eG1wTU06SGlzdG9yeT4gPHJkZjpTZXE+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJjcmVhdGVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjRkMGU2OTJmLTk0ZTctNDA0Mi1hY2NiLTZlNzhhMzBlNTdmYyIgc3RFdnQ6d2hlbj0iMjAyMC0wNC0xN1QwOTo0ODo1OSswMjowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIENDIDIwMTkgKFdpbmRvd3MpIi8+IDxyZGY6bGkgc3RFdnQ6YWN0aW9uPSJzYXZlZCIgc3RFdnQ6aW5zdGFuY2VJRD0ieG1wLmlpZDplOWI0NzcwZC1iM2ViLWQ1NDMtYmMyYi1lYzg5NjA2MTdjZGUiIHN0RXZ0OndoZW49IjIwMjAtMDQtMTdUMDk6NDk6NTQrMDI6MDAiIHN0RXZ0OnNvZnR3YXJlQWdlbnQ9IkFkb2JlIFBob3Rvc2hvcCBDQyAyMDE5IChXaW5kb3dzKSIgc3RFdnQ6Y2hhbmdlZD0iLyIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0ic2F2ZWQiIHN0RXZ0Omluc3RhbmNlSUQ9InhtcC5paWQ6OWYxYzc2OWEtOGU4Ni1hYzRlLWE5OWEtMzczNDY2MTNiYThlIiBzdEV2dDp3aGVuPSIyMDIzLTAzLTIxVDEwOjE1OjE3KzAxOjAwIiBzdEV2dDpzb2Z0d2FyZUFnZW50PSJBZG9iZSBQaG90b3Nob3AgMjMuMSAoV2luZG93cykiIHN0RXZ0OmNoYW5nZWQ9Ii8iLz4gPHJkZjpsaSBzdEV2dDphY3Rpb249ImNvbnZlcnRlZCIgc3RFdnQ6cGFyYW1ldGVycz0iZnJvbSBhcHBsaWNhdGlvbi92bmQuYWRvYmUucGhvdG9zaG9wIHRvIGltYWdlL3BuZyIvPiA8cmRmOmxpIHN0RXZ0OmFjdGlvbj0iZGVyaXZlZCIgc3RFdnQ6cGFyYW1ldGVycz0iY29udmVydGVkIGZyb20gYXBwbGljYXRpb24vdm5kLmFkb2JlLnBob3Rvc2hvcCB0byBpbWFnZS9wbmciLz4gPHJkZjpsaSBzdEV2dDphY3Rpb249InNhdmVkIiBzdEV2dDppbnN0YW5jZUlEPSJ4bXAuaWlkOjE0Y2YxZWMwLWM1ZGMtMWU0MS05ODcwLWEwNzM3NmMzMzUyNiIgc3RFdnQ6d2hlbj0iMjAyMy0wMy0yMVQxMDoxNToxNyswMTowMCIgc3RFdnQ6c29mdHdhcmVBZ2VudD0iQWRvYmUgUGhvdG9zaG9wIDIzLjEgKFdpbmRvd3MpIiBzdEV2dDpjaGFuZ2VkPSIvIi8+IDwvcmRmOlNlcT4gPC94bXBNTTpIaXN0b3J5PiA8eG1wTU06RGVyaXZlZEZyb20gc3RSZWY6aW5zdGFuY2VJRD0ieG1wLmlpZDo5ZjFjNzY5YS04ZTg2LWFjNGUtYTk5YS0zNzM0NjYxM2JhOGUiIHN0UmVmOmRvY3VtZW50SUQ9ImFkb2JlOmRvY2lkOnBob3Rvc2hvcDo5NzA2MWVmMi02NmRjLWYyNGYtYmUzMi01YTU3YTliN2E0MzQiIHN0UmVmOm9yaWdpbmFsRG9jdW1lbnRJRD0ieG1wLmRpZDo0ZDBlNjkyZi05NGU3LTQwNDItYWNjYi02ZTc4YTMwZTU3ZmMiLz4gPHBob3Rvc2hvcDpUZXh0TGF5ZXJzPiA8cmRmOkJhZz4gPHJkZjpsaSBwaG90b3Nob3A6TGF5ZXJOYW1lPSI1LDMiIHBob3Rvc2hvcDpMYXllclRleHQ9IjUsMyIvPiA8cmRmOmxpIHBob3Rvc2hvcDpMYXllck5hbWU9IiZhbXA7IiBwaG90b3Nob3A6TGF5ZXJUZXh0PSImYW1wOyIvPiA8cmRmOmxpIHBob3Rvc2hvcDpMYXllck5hbWU9IisiIHBob3Rvc2hvcDpMYXllclRleHQ9IisiLz4gPHJkZjpsaSBwaG90b3Nob3A6TGF5ZXJOYW1lPSIhIiBwaG90b3Nob3A6TGF5ZXJUZXh0PSIhIi8+IDxyZGY6bGkgcGhvdG9zaG9wOkxheWVyTmFtZT0iNSAvIHMiIHBob3Rvc2hvcDpMYXllclRleHQ9IjUgLyBzIi8+IDxyZGY6bGkgcGhvdG9zaG9wOkxheWVyTmFtZT0iNSAvIHMiIHBob3Rvc2hvcDpMYXllclRleHQ9IjUgLyBzIi8+IDwvcmRmOkJhZz4gPC9waG90b3Nob3A6VGV4dExheWVycz4gPHBob3Rvc2hvcDpEb2N1bWVudEFuY2VzdG9ycz4gPHJkZjpCYWc+IDxyZGY6bGk+YWRvYmU6ZG9jaWQ6cGhvdG9zaG9wOjA4MmUzOWVjLWIwYmEtN2M0ZS04NTU4LWQ3NzM3Y2I5ZGVkYzwvcmRmOmxpPiA8cmRmOmxpPmFkb2JlOmRvY2lkOnBob3Rvc2hvcDo3YmE5NzQyOC0xMmQ5LWY2NDAtYTA3ZC1hMTEyZGVkNDNjZGM8L3JkZjpsaT4gPHJkZjpsaT5hZG9iZTpkb2NpZDpwaG90b3Nob3A6OGY3OTQxNmYtNzc5ZS1jNTRkLWEyNjYtMDY5YjhmZGJlZTQ5PC9yZGY6bGk+IDxyZGY6bGk+YWRvYmU6ZG9jaWQ6cGhvdG9zaG9wOjk3MDYxZWYyLTY2ZGMtZjI0Zi1iZTMyLTVhNTdhOWI3YTQzNDwvcmRmOmxpPiA8L3JkZjpCYWc+IDwvcGhvdG9zaG9wOkRvY3VtZW50QW5jZXN0b3JzPiA8L3JkZjpEZXNjcmlwdGlvbj4gPC9yZGY6UkRGPiA8L3g6eG1wbWV0YT4gPD94cGFja2V0IGVuZD0iciI/PqfTzEEAADp5SURBVHic7Z15cBRXnue/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",
};