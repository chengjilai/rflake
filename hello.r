ggplot2::ggsave(filename="hello.svg", plot =ggplot2::ggplot() + ggplot2::geom_point(ggplot2::aes(x = c(1,2,3), y = c(2,4,6)))+ggplot2::labs(x = "x", y = "y"), width=200, height=200, units="mm")
