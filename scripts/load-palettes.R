library('ggplot2')
library('RColorBrewer')
library('khroma')
library('colorspace')

## Generate light and dark variants of country
## Tol's high contrast palette, 3-colors
# https://sronpersonalpages.nl/~pault/data/colourschemes.pdf
col_pal_country_dark = khroma::color('high contrast')(3) %>%
    setNames(c('Panama', 'Peru', 'US'))

## 50% transparent mix for light version
col_pal_country_light = col_pal_country_dark %>%
    lapply(function(co) hex(mixcolor(alpha = 0.5, color1 = hex2RGB(co), color2 = hex2RGB('#FFFFFF')))) %>%
    do.call('c',.)

## 25% transparent mix for pale
col_pal_country_pale = col_pal_country_light %>%
    lapply(function(co) hex(mixcolor(alpha = 0.5, color1 = hex2RGB(co), color2 = hex2RGB('#FFFFFF')))) %>%
    do.call('c',.)

## Build colorscales for ggplot2
scale_fill_country_inner = scale_fill_manual(breaks = names(col_pal_country_light), values = col_pal_country_light)
scale_fill_country_outer = scale_fill_manual(breaks = names(col_pal_country_dark), values = col_pal_country_dark)
scale_fill_country_pale = scale_fill_manual(breaks = names(col_pal_country_pale), values = col_pal_country_pale)
scale_color_country_outer = scale_color_manual(breaks = names(col_pal_country_dark), values = col_pal_country_dark)
scale_color_country_pale = scale_color_manual(breaks = names(col_pal_country_pale), values = col_pal_country_pale)

## Responder vs. nonresponder
## Changed on 09-10-2025: swapped the orange for a gray color
col_pal_sero_dark = c('#7777AA', khroma::color('vibrant')(6)[6]) %>%
    setNames(c('Non-responder', 'Responder'))

## 50% transparent mix for light version
col_pal_sero_light = col_pal_sero_dark %>%
    lapply(function(co) hex(mixcolor(alpha = 0.5, color1 = hex2RGB(co), color2 = hex2RGB('#FFFFFF')))) %>%
    do.call('c',.)

## 50% transparent mix for light version
col_pal_sero_pale = col_pal_sero_light %>%
    lapply(function(co) hex(mixcolor(alpha = 0.5, color1 = hex2RGB(co), color2 = hex2RGB('#FFFFFF')))) %>%
    do.call('c',.)

## Build colorscales for ggplot2
scale_fill_sero_inner = scale_fill_manual(breaks = names(col_pal_sero_light), values = col_pal_sero_light)
scale_fill_sero_outer = scale_fill_manual(breaks = names(col_pal_sero_dark), values = col_pal_sero_dark)
scale_fill_sero_pale = scale_fill_manual(breaks = names(col_pal_sero_pale), values = col_pal_sero_pale)
scale_color_sero_outer = scale_color_manual(breaks = names(col_pal_sero_dark), values = col_pal_sero_dark)

## Statistical significance
col_pal_signif = c('*' = '#4477AA', '.' = '#66CCEE', 'n.s.' = '#BBBBBB')
col_pal_signif_pale = col_pal_signif %>%
    lapply(function(co) hex(mixcolor(alpha = 0.5, color1 = hex2RGB(co), color2 = hex2RGB('#FFFFFF')))) %>%
    do.call('c',.)

scale_fill_signif = scale_fill_manual(breaks = names(col_pal_signif), values = col_pal_signif)
scale_color_signif = scale_color_manual(breaks = names(col_pal_signif), values = col_pal_signif)

## Generate light and dark variants of visit
# https://sronpersonalpages.nl/~pault/data/colourschemes.pdf
col_pal_visit_dark = c("#88CCEE", "#44AA99", "#117733") %>% #khroma::color('muted')(9) %>%
    setNames(c('NB', '2mo', '4mo'))

## 50% transparent mix for light version
col_pal_visit_light = col_pal_visit_dark %>%
    lapply(function(co) hex(mixcolor(alpha = 0.5, color1 = hex2RGB(co), color2 = hex2RGB('#FFFFFF')))) %>%
    do.call('c',.)

## 25% transparent mix for pale
col_pal_visit_pale = col_pal_visit_light %>%
    lapply(function(co) hex(mixcolor(alpha = 0.5, color1 = hex2RGB(co), color2 = hex2RGB('#FFFFFF')))) %>%
    do.call('c',.)


## Build colorscales for ggplot2
scale_fill_visit_inner = scale_fill_manual(breaks = names(col_pal_visit_light), values = col_pal_visit_light)
scale_fill_visit_outer = scale_fill_manual(breaks = names(col_pal_visit_dark), values = col_pal_visit_dark)
scale_fill_visit_pale = scale_fill_manual(breaks = names(col_pal_visit_pale), values = col_pal_visit_pale)
scale_color_visit_outer = scale_color_manual(breaks = names(col_pal_visit_dark), values = col_pal_visit_dark)

## Responder vs. nonresponder
col_pal_pcr_dark = c('#7777AA', khroma::color('vibrant')(6)[6]) %>%
    setNames(c('Negative', 'Positive'))

## 50% transparent mix for light version
col_pal_pcr_light = col_pal_pcr_dark %>%
    lapply(function(co) hex(mixcolor(alpha = 0.5, color1 = hex2RGB(co), color2 = hex2RGB('#FFFFFF')))) %>%
    do.call('c',.)

## 50% transparent mix for light version
col_pal_pcr_pale = col_pal_pcr_light %>%
    lapply(function(co) hex(mixcolor(alpha = 0.5, color1 = hex2RGB(co), color2 = hex2RGB('#FFFFFF')))) %>%
    do.call('c',.)

## Build colorscales for ggplot2
scale_fill_pcr_inner = scale_fill_manual(breaks = names(col_pal_pcr_light), values = col_pal_pcr_light)
scale_fill_pcr_outer = scale_fill_manual(breaks = names(col_pal_pcr_dark), values = col_pal_pcr_dark)
scale_fill_pcr_pale = scale_fill_manual(breaks = names(col_pal_pcr_pale), values = col_pal_pcr_pale)
scale_color_pcr_outer = scale_color_manual(breaks = names(col_pal_pcr_dark), values = col_pal_pcr_dark)

