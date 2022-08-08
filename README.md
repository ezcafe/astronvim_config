# astronvim_config

```
# Make a backup of your current nvim folder
mv ~/.config/nvim ~/.config/nvim.bak

# Clean old plugins
mv ~/.local/share/nvim/site ~/.local/share/nvim/site.bak

# Cleanup cache
rm -rf ~/.cache/nvim

# Clone the AstroNvim repository
git clone https://github.com/AstroNvim/AstroNvim ~/.config/nvim

# Clone custom configuration
git clone https://github.com/ezcafe/astronvim_config.git ~/.config/nvim/lua/user

# Initialize AstroNvim
nvim --headless -c 'autocmd User PackerComplete quitall' -c 'PackerSync'
```

## Key maps

### General

| Mode | Action                                     | Mappings     |
| ---- | ------------------------------------------ | ------------ |
| n    | Leader key                                 | Space        |
| n    | Colon key                                  | ;            |
| n    | Escape key                                 | jj, jk       |
| n    | Save                                       | Space + w    |
| n    | Force write                                | Ctrl + s     |
| n    | Quit                                       | Space + q    |
| n    | Force quit                                 | Ctrl + q     |
| n    | No Highlight                               | Space + h    |
| n    | Up Window                                  | Ctrl + k     |
| n    | Down Window                                | Ctrl + j     |
| n    | Left Window                                | Ctrl + h     |
| n    | Right Window                               | Ctrl + l     |
| n    | Resize split up                            | Ctrl + Up    |
| n    | Resize split down                          | Ctrl + Down  |
| n    | Resize split left                          | Ctrl + Left  |
| n    | Resize split right                         | Ctrl + Right |
| n    | Write                                      | Ctrl + s     |
| n    | Force Write                                | Ctrl + S     |
| n    | Quit                                       | Ctrl + q     |
| n    | Force Quit                                 | Ctrl + Q     |
| n    | New File                                   | Space + fn   |
| n    | Comment                                    | Space + /    |
| n    | Toggle URL Highlighting                    | Space + u    |
| n    | Open the file under cursor with system app | gx           |

### Buffers

| Mode | Action            | Mappings              | Plugin?         | Custom? |
| ---- | ----------------- | --------------------- | --------------- | ------- |
| n    | Close Buffer      | Space + c, Space + bc |                 | Yes     |
| n    | New Buffer        | Space + bn            |                 | Yes     |
| n    | Next Buffer       | Shift + l             |
| n    | Previous Buffer   | Shift + h             |
| n    | Move Buffer Right | >b                    | bufferline.nvim |
| n    | Move Buffer Left  | <b                    | bufferline.nvim |
| n    | Buffers           | Space + fb            | telescope.nvim  |

### Dashboard (alpha-nvim)

| Mode | Action    | Mappings  |
| ---- | --------- | --------- |
| n    | Dashboard | Space + d |

### Git

| Mode | Action            | Mappings               | Plugin?        | Custom? |
| ---- | ----------------- | ---------------------- | -------------- | ------- |
| n    | Next Hunk         | Space + gj             | gitsigns.nvim  |
| n    | Previous Hunk     | Space + gk             | gitsigns.nvim  |
| n    | Blame Line        | Space + gl             | gitsigns.nvim  |
| n    | Blame Line Toggle | Space + gL             | gitsigns.nvim  | Yes     |
| n    | Preview Hunk      | Space + gp             | gitsigns.nvim  |
| n    | Reset Hunk        | Space + gh, Space + gr | gitsigns.nvim  | Yes     |
| n    | Reset Buffer      | Space + gR             | gitsigns.nvim  | Yes     |
| n    | Stage Hunk        | Space + ga             | gitsigns.nvim  | Yes     |
| n    | Stage Buffer      | Space + gA             | gitsigns.nvim  | Yes     |
| n    | Unstage Hunk      | Space + gu             | gitsigns.nvim  |
| n    | Unstage Buffer    | Space + gU             | gitsigns.nvim  | Yes     |
| n    | Git Diff          | Space + gd             | gitsigns.nvim  |
| n    | Git Status        | Space + gt             | telescope.nvim |
| n    | Git Branches      | Space + gb, Space + sb | telescope.nvim |
| n    | Git Commits       | Space + gc             | telescope.nvim |
| n    | Git Status        | Space + gs             | telescope.nvim | Yes     |

### Hop

| Mode | Action           | Mappings   | Plugin?  | Custom? |
| ---- | ---------------- | ---------- | -------- | ------- |
| n, v | Hop Character    | Space + hc | hop.nvim | Yes     |
| n, v | Hop 2 Characters | Space + hC | hop.nvim | Yes     |
| n, v | Hop Line         | Space + hl | hop.nvim | Yes     |
| n, v | Hop Pattern      | Space + hp | hop.nvim | Yes     |
| n, v | Hop Word         | Space + hw | hop.nvim | Yes     |

### LSP

| Mode | Action               | Mappings       | Plugin?              |
| ---- | -------------------- | -------------- | -------------------- |
| n    | LSP Info             | Space + li     | mason-lspconfig.nvim |
| n    | LSP Installer        | Space + lI     | mason.nvim           |
| n    | Hover Document       | Shift + k      |
| n    | Format Document      | Space + lf     |
| n    | Symbols Outline      | Space + lS     | aerial.nvim          |
| n    | Line Diagnostics     | gl, Space + ld |
| n    | All Diagnostics      | Space + lD     | telescope.nvim       |
| n    | Code Actions         | Space + la     |
| n    | Signature Help       | Space + lh     |
| n    | Rename               | Space + lr     |
| n    | Document Symbols     | Space + ls     | telescope.nvim       |
| n    | Diagnostic Next      | ]d             |
| n    | Diagnostics Previous | [d             |
| n    | Declaration          | gD             |
| n    | Definition           | gd             |
| n    | Implementation       | gI             |
| n    | References           | gr, Space + lR | telescope.nvim       |

### Packer

| Mode | Action         | Mappings   |
| ---- | -------------- | ---------- |
| n    | Packer Compile | Space + pc |
| n    | Packer Install | Space + pi |
| n    | Packer Sync    | Space + ps |
| n    | Packer Status  | Space + pS |
| n    | Packer Update  | Space + pu |

### Session

| Mode | Action                         | Mappings   | Plugin?                |
| ---- | ------------------------------ | ---------- | ---------------------- |
| n    | Save Session                   | Space + Ss | neovim-session-manager |
| n    | Last Session                   | Space + Sl | neovim-session-manager |
| n    | Delete Session                 | Space + Sd | neovim-session-manager |
| n    | Search Sessions                | Space + Sf | neovim-session-manager |
| n    | Load Current Directory Session | Space + S. | neovim-session-manager |

### Telescope (telescope.nvim)

| Mode | Action                            | Mappings                           | Custom? |
| ---- | --------------------------------- | ---------------------------------- | ------- |
| n    | Live Grep                         | Space + fw                         |
| n    | Live Grep (include hidden files)  | Space + fW                         |
| n    | Find files                        | Space + ff                         |
| n    | Find files (include hidden files) | Space + fF                         |
| n    | Help Tags                         | Space + fh, Space + sh, Space + f? | Yes     |
| n    | Marks                             | Space + fm, Space + f'             | Yes     |
| n    | Old Files                         | Space + fo, Space + fh             | Yes     |
| n    | Search for word under cursor      | Space + fc                         |
| n    | Man Pages                         | Space + sm, Space + fm             | Yes     |
| n    | Notifications                     | Space + sn, Space + fn             | Yes     |
| n    | Registers                         | Space + sr, Space + fr             | Yes     |
| n    | Keymaps                           | Space + sk, Space + fk             | Yes     |
| n    | Commands                          | Space + sc, Space + fc             | Yes     |
| n    | Themes                            | Space + ft                         | Yes     |

### Tree

| Mode | Action                    | Mappings  | Plugin?       | Custom? |
| ---- | ------------------------- | --------- | ------------- | ------- |
| n    | Toggle Explorer           | Space + e | neo-tree.nvim |
| n    | Focus Explorer            | Space + o | neo-tree.nvim |
| n    | Open                      | Ctrl + t  | neo-tree.nvim | Yes     |
| n    | Open as horizontal window | Ctrl + x  | neo-tree.nvim | Yes     |
| n    | Open in vertical window   | Ctrl + v  | neo-tree.nvim | Yes     |
| n    | Close all nodes           | C         | neo-tree.nvim | Yes     |

### Terminal

| Mode | Action                           | Mappings                 | Plugin?         | Custom? |
| ---- | -------------------------------- | ------------------------ | --------------- | ------- |
| n    | Toggle Terminal                  | Ctrl + \|toggleterm.nvim |
| n    | Floating Terminal                | Space + tf               | toggleterm.nvim |
| n    | Horizontal Split Terminal        | Space + th, Space + tx   | toggleterm.nvim | Yes     |
| n    | Vertical Split Terminal          | Space + tv               | toggleterm.nvim |
| n    | LazyGit                          | Space + tl, Space + gg   | toggleterm.nvim |
| n    | Node                             | Space + tn               | toggleterm.nvim |
| n    | NCDU                             | Space + tu               | toggleterm.nvim |
| n    | Htop                             | Space + tt               | toggleterm.nvim |
| n    | Python                           | Space + tp               | toggleterm.nvim |
| t    | Terminal normal mode             | Esc                      |
| t    | Terminal normal mode             | jk                       |
| t    | Terminal left window navigation  | Ctrl + h                 |
| t    | Terminal down window navigation  | Ctrl + j                 |
| t    | Terminal up window navigation    | Ctrl + k                 |
| t    | Terminal right window navigation | Ctrl + l                 |

### Text

| Mode | Action       | Mappings      | Plugin?      |
| ---- | ------------ | ------------- | ------------ |
| n, v | Comment line | Space + /     | Comment.nvim |
| v    | <            | Unindent line |
| v    | >            | indent line   |

### Zen mode

| Mode | Action     | Mappings   | Plugin?       | Custom? |
| ---- | ---------- | ---------- | ------------- | ------- |
| n    | Ataraxis   | Space + za | true-zen.nvim | Yes     |
| n    | Focus      | Space + zf | true-zen.nvim | Yes     |
| n, v | Narrow     | Space + zn | true-zen.nvim | Yes     |
| n    | Minimalist | Space + zm | true-zen.nvim | Yes     |
