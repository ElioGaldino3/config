local status, gpt = pcall(require, "chatgpt")
if not status then return end

gpt.setup {
  api_key_cmd = "pass show chatgptneovim",
  openai_params = {
    model = "gpt-4o",
    max_tokens = 700,
  },
}
