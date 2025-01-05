-- StatusLine
return { 'feline-nvim/feline.nvim',
    config = function()
    local line_ok, feline = pcall(require, "feline")
    if not line_ok then
        return
    end

    local one_monokai = {
        fg = "#abb2bf",
        bg = "none",
        green = "#9ece6a",
        yellow = "#9d7cd8",
        purple = "#c678dd",
        orange = "#d19a66",
        peanut = "#f6d5a4",
        red = "#ff757f",
        aqua = "#61afef",
        darkblue = "#282c34",
        dark_red = "#f75f5f",
    }

    local vi_mode_colors = {
        NORMAL = "green",
        OP = "green",
        INSERT = "yellow",
        VISUAL = "purple",
        LINES = "orange",
        BLOCK = "dark_red",
        REPLACE = "red",
        COMMAND = "aqua",
    }

    local c = {
        vim_mode = {
            provider = {
                name = "vi_mode",
                opts = {
                    show_mode_name = true,
                    -- padding = "center", -- Uncomment for extra padding.
                },
            },
            hl = function()
                return {
                    fg = require("feline.providers.vi_mode").get_mode_color(),
                    bg = "none",
                    -- style = "bold",
                    name = "NeovimModeHLColor",
                }
            end,
            left_sep = " ",
            right_sep = " ",
        },
        gitBranch = {
            provider = "git_branch",
            hl = {
                fg = "purple",
                bg = "none",
                -- style = "bold",
            },
            left_sep = " ",
            right_sep = " ",
        },
        gitDiffAdded = {
            provider = "git_diff_added",
            hl = {
                fg = "green",
                bg = "none",
            },
            left_sep = " ",
            right_sep = " ",
        },
        gitDiffRemoved = {
            provider = "git_diff_removed",
            hl = {
                fg = "red",
                bg = "none",
            },
            left_sep = " ",
            right_sep = " ",
        },
        gitDiffChanged = {
            provider = "git_diff_changed",
            icon = ' ',
            hl = {
                fg = "yellow",
                bg = "none",
            },
            left_sep = " ",
            right_sep = " ",
        },
        separator = {
            provider = " ",
        },
        fileinfo = {
            provider = {
                name = "file_info",
                opts = {
                    type = "relative-short",
                },
            },
            hl = {
                -- style = "bold",
            },
            left_sep = " ",
            right_sep = " ",
        },
        diagnostic_errors = {
            provider = "diagnostic_errors",
            hl = {
                fg = "red",
            },
        },
        diagnostic_warnings = {
            provider = "diagnostic_warnings",
            hl = {
                fg = "yellow",
            },
        },
        diagnostic_hints = {
            provider = "diagnostic_hints",
            hl = {
                fg = "aqua",
            },
        },
        diagnostic_info = {
            provider = "diagnostic_info",
        },
        lsp_client_names = {
            provider = "lsp_client_names",
            hl = {
                fg = "purple",
                bg = "none",
                -- style = "bold",
            },
            left_sep = " ",
            right_sep = " ",
        },
        file_type = {
            provider = {
                name = "file_type",
                opts = {
                    filetype_icon = true,
                    case = "titlecase",
                },
            },
            hl = {
                fg = "red",
                bg = "none",
                -- style = "bold",
            },
            left_sep = " ",
            right_sep = " ",
        },
        file_encoding = {
            provider = "file_encoding",
            hl = {
                fg = "orange",
                bg = "none",
                style = "italic",
            },
            left_sep = " ",
            right_sep = " ",
        },
        position = {
            provider = "position",
            hl = {
                fg = "green",
                bg = "none",
                -- style = "bold",
            },
            left_sep = " ",
            right_sep = " ",
        },
        line_percentage = {
            provider = "line_percentage",
            hl = {
                fg = "aqua",
                bg = "none",
                -- style = "bold",
            },
            left_sep = " ",
            right_sep = " ",
        },
        scroll_bar = {
            provider = "scroll_bar",
            hl = {
                fg = "black",
                -- style = "bold",
            },
        },
    }

    local left = {
        c.vim_mode,
        c.gitBranch,
        c.gitDiffAdded,
        c.gitDiffRemoved,
        c.gitDiffChanged,
        c.separator,
    }

    local middle = {
        c.fileinfo,
        c.diagnostic_errors,
        c.diagnostic_warnings,
        c.diagnostic_info,
        c.diagnostic_hints,
    }

    local right = {
        c.lsp_client_names,
        c.file_type,
        -- c.file_encoding,
        c.position,
        c.line_percentage,
        c.scroll_bar,
    }

    local components = {
        active = {
            left,
            middle,
            right,
        },
        inactive = {
            left,
            middle,
            right,
        },
    }

    feline.setup({
        components = components,
        theme = one_monokai,
        vi_mode_colors = vi_mode_colors,
    })
    end
}
