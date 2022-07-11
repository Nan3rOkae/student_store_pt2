const db = require("../db");

class Order {
  static async listOrdersForUser() {
    // will return all orders that the aunthenticated user has created
  }

  static async createOrder() {
    //method will take a user's order and store it in the database
  }
}

module.exports = Order;
