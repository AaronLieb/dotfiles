-- it seems like jdtls is the thing causing my status bar to be taken over by lsp info

local PACKAGE_ROOT_FILE = "packageInfo"
local home = os.getenv("HOME")

local function get_workspace_folders_from_bemol(root_dir)
    local ws_root_folders = root_dir .. "/.bemol/ws_root_folders"
    if vim.fn.glob(ws_root_folders) ~= "" then
        local workspace_folders = {}
        for line in io.lines(ws_root_folders) do
            table.insert(workspace_folders, "file://" .. line)
        end
        return workspace_folders
    else
        print("WARNING: Bemol file is missing")
        return nil
    end
end

return {
    "AstroNvim/astrocommunity",
    { import = "astrocommunity.pack.java" },
    {
        "mfussenegger/nvim-jdtls",
        opts = {
            settings = {
                ['java.settings.url'] = home .. '/.config/nvim/lsp-settings/jdtls/settings.pref',
            }
        }
    }
}
