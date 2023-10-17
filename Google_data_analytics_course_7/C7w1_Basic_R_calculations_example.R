# example calculations in R

quarter_1_sales <- 35657.98
quarter_2_sales <- 43810.55
midyear_sales <- quarter_1_sales + quarter_2_sales
midyear_sales

yearend_sales <- midyear_sales * 2
yearend_sales

# example if/else code
x <- -1
if (x < 0) {
  print("x is a negative number")
} else if (x == 0) {
  print("x is zero")
} else {
  print("x is a positive number")
}
