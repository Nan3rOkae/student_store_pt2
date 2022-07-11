const db = require("../db");

class Store {
  static async listProducts() {
    const query = "SELECT * FROM products";
    const list = await db.query(query);
    return list;
  }
}

module.exports = Store;
