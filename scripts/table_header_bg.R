## allows changes to header styles in ggtable objects
table_header_bg = function (tab, column, fill = NULL, color = NULL, linewidth = NULL, 
    alpha = NULL) 
{
    .find_header = function (tab, column, name = "colhead-bg") 
    {
        l <- tab$layout
        which(l$l == column & l$name == name)
    }

    tabGrob <- get_tablegrob(tab)
    cells <- expand.grid(column = column)
    for (i in 1:nrow(cells)) {
        tc <- .find_header(tabGrob, cells$column[i], 
            "colhead-bg")
        tabGrob$grobs[tc][[1]][["gp"]] <- grid::gpar(fill = fill, 
            col = color, lwd = linewidth, alpha = alpha)
    }
    tab_return_same_class_as_input(tabGrob, input = tab)
}

environment(table_header_bg) = asNamespace('ggpubr')



library('grid')
library('gtable')

add_spanner_label <- function(grob, left_col, right_col, label, gp = gpar(fontsize = 12, fontface = "bold"))
{
  # Add a new row at the top for the spanner label
  
  # Create the spanner label grob
  spanner_label <- textGrob(label, gp = gp, just = "center")
  
  # Add the label grob spanning the specified columns in the new top row
  grob <- gtable_add_grob(grob, grobs = spanner_label, t = 1, b = 1, l = left_col, r = right_col)
  
  grob
}

