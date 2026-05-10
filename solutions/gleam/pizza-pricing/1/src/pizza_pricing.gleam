import gleam/list
// TODO: please define the Pizza custom type
pub type Pizza{
  Margherita
  Caprese
  Formaggio
  ExtraSauce(Pizza)
  ExtraToppings(Pizza)
}
pub fn pizza_price(pizza: Pizza) -> Int {
  case pizza{
    Margherita -> 7
    Caprese -> 9
    Formaggio -> 10
    ExtraSauce(inner) -> pizza_price(inner) + 1
    ExtraToppings(inner) -> pizza_price(inner) + 2
  }
}

pub fn order_price(order: List(Pizza)) -> Int {
  let price_before_fee = list.fold(order, 0, fn(acc, order){acc+pizza_price(order)})
  let count_pizzas = list.length(order)
  let price_with_fee = case count_pizzas{
    1 -> 3
    2 -> 2
    _ -> 0
  }
  price_before_fee + price_with_fee
}
