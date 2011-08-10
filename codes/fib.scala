object Fib {
  def apply(num : Int) : Int = {
    num match {
      case 0 => 0
      case 1 => 1
      case n => this(n - 2) + this(n - 1)
    }
  }

  def fun(num : Int)(c : Int => Int) = {
    c(num)
  }
}
