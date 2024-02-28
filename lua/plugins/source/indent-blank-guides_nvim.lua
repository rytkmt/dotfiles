require('indent_blank_guides').setup({
  indent_levels = 30;
  indent_guide_size = 2;
  indent_start_level = 1;
  indent_enable = true;
  indent_space_guides = true;
  indent_tab_guides = false;
  indent_soft_pattern = '\\s';
  exclude_filetypes = {'help','dashboard','dashpreview','NvimTree','vista','sagahover'};
  even_colors = {fg='nocombine', bg='#292938'};
  odd_colors = { fg='nocombine', bg='#232328' };
})
