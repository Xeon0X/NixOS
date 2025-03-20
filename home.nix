{
  ...
}: {
  # Home Manager needs a bit of information about you and the
  # paths it should manage.
  home.username = "xeon0x";
  home.homeDirectory = "/home/xeon0x";

  # This value determines the Home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new Home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update Home Manager without changing this value. See
  # the Home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.11";
  programs.home-manager.enable = true;
  programs.git = {
    enable = true;
    userName = "Xeon0X";
    userEmail = "xeon0x.gaming@gmail.com";
  };
  programs.zed-editor = {
    enable = true;
    extensions = ["nix" "ruff"];
    userKeymaps = [
      {
        context = "Workspace";
        bindings = {
          "ctrl-&" = "terminal_panel::ToggleFocus";
          "ctrl-!" = "assistant::ToggleFocus";
        };
      }
      {
        context = "Editor";
        bindings = {
        };
      }
      {
        context = "Editor && !edit_prediction";
        bindings = {
          "alt-!" = "editor::ShowEditPrediction";
        };
      }
    ];
    userSettings = {
      # Zed settings
      #
      # For information on how to configure Zed, see the Zed
      # documentation: https:#zed.dev/docs/configuring-zed
      #
      # To see all of Zed's default settings without changing your
      # custom settings, run the `zed: Open Default Settings` command
      # from the command palette
      # Settings
      telemetry = {
        diagnostics = false;
        metrics = false;
      };
      autosave = {
        after_delay = {
          milliseconds = 60000;
        };
      };
      auto_update = true;
      format_on_save = "on";
      formatter = "auto";
      soft_wrap = "preferred_line_length";
      preferred_line_length = 80;
      diagnostics = {
        include_warnings = true;
        inline = {
          enabled = true;
          update_debounce_ms = 150;
          padding = 8;
          min_column = 81;
          max_severity = null;
        };
      };

      # Theme
      theme = {
        mode = "system";
        light = "One Light";
        dark = "One Dark";
      };
      ui_font_size = 16;
      ui_font_family = "Cascadia Mono";
      buffer_font_size = 14;
      buffer_font_family = "Cascadia Code";
      indent_guides = {
        enabled = true;
        line_width = 1;
        active_line_width = 5;
        coloring = "indent_aware";
        background_coloring = "indent_aware";
      };

      # Panels
      tabs = {
        git_status = true;
        file_icons = true;
      };
      collaboration_panel = {
        button = false;
      };
      chat_panel = {
        button = false;
      };
      project_panel = {
        auto_fold_dirs = false;
      };

      # Terminal
      terminal = {
        default_width = 500;
        dock = "right";
        working_directory = "current_project_directory";
        detect_venv = {
          on = {
            directories = [".venv"];
            activate_script = "default";
          };
        };
      };

      # Assistant
      assistant = {
        default_height = 220;
        default_width = 500;
        button = true;
        dock = "right";
        default_model = {
          provider = "zed.dev";
          model = "mistral-large-latest";
        };
        version = "2";
      };

      features = {
        edit_prediction_provider = "zed";
        smart_completion = true;
      };
      show_edit_predictions = true;

      # Languages
      auto_signature_help = true;
      languages = {
        Python = {
          language_servers = ["pyright" "ruff"];
          format_on_save = "on";
          formatter = [
            {
              code_actions = {
                "source.fixAll.ruff" = true;
                "source.organizeImports.ruff" = true;
              };
            }
          ];
        };
      };
      lsp = {
        pyright = {
          settings = {
            python.analysis = {
              diagnosticMode = "workspace";
            };
            python = {
              pythonPath = ".venv/bin/python";
            };
          };
        };
      };

      # Preferences
      preferences = {
        includeInlayParameterNameHints = "all";
        includeInlayParameterNameHintsWhenArgumentMatchesName = true;
        includeInlayFunctionParameterTypeHints = true;
        includeInlayVariableTypeHints = true;
        includeInlayVariableTypeHintsWhenTypeMatchesName = true;
        includeInlayPropertyDeclarationTypeHints = true;
        includeInlayFunctionLikeReturnTypeHints = true;
        includeInlayEnumMemberValueHints = true;
      };
    };
  };
}
