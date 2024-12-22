package hcmuaf.nlu.edu.vn.testproject.daos;

import hcmuaf.nlu.edu.vn.testproject.models.CartItem;

import java.util.ArrayList;
import java.util.List;

public class ShoppingCart {
    List<CartItem> cartItems;

    public ShoppingCart() {
        this.cartItems = new ArrayList<>();
    }

    private void Add(CartItem cartItem){
        this.cartItems.add(cartItem);
    }

    private void Remote(CartItem cartItem){
        this.cartItems.remove(cartItem);
    }

    public int getSize(){
        int size = 0;
        for (CartItem cartItem : this.cartItems) {
            size += cartItem.getQuantity();
        }
        return size;
    }


}
