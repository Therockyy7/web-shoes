
package model;

public class Products {
    private int productID;
    private String name;
    private String brand;
    private int categoryID;
    private double price;
    private String description;
    private String imageURL;
    private int stockQuantity;
    private int manufacturerID;

    // Constructors, getters and setters

    public Products() {}

    public Products(int productID, String name, double price, String description, String imageURL) {
        this.productID = productID;
        this.name = name;
        this.price = price;
        this.description = description;
        this.imageURL = imageURL;
    }

    public Products(int productID, String name, String brand, int categoryID, double price, String description, String imageURL, int stockQuantity, int manufacturerID) {
        this.productID = productID;
        this.name = name;
        this.brand = brand;
        this.categoryID = categoryID;
        this.price = price;
        this.description = description;
        this.imageURL = imageURL;
        this.stockQuantity = stockQuantity;
        this.manufacturerID = manufacturerID;
    }

    // Getters and setters...

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public int getCategoryID() {
        return categoryID;
    }

    public void setCategoryID(int categoryID) {
        this.categoryID = categoryID;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getImageURL() {
        return imageURL;
    }

    public void setImageURL(String imageURL) {
        this.imageURL = imageURL;
    }

    public int getStockQuantity() {
        return stockQuantity;
    }

    public void setStockQuantity(int stockQuantity) {
        this.stockQuantity = stockQuantity;
    }

    public int getManufacturerID() {
        return manufacturerID;
    }

    public void setManufacturerID(int manufacturerID) {
        this.manufacturerID = manufacturerID;
    }
    
}
