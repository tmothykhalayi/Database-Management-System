-- Brand Table
CREATE TABLE brand (
  brand_id SERIAL PRIMARY KEY,
  brand_name VARCHAR(255) NOT NULL
);

-- Product Category Table
CREATE TABLE product_category (
  category_id SERIAL PRIMARY KEY,
  category_name VARCHAR(255) NOT NULL
);

-- Color Table
CREATE TABLE color (
  color_id SERIAL PRIMARY KEY,
  color_name VARCHAR(100) NOT NULL
);

-- Size Category Table
CREATE TABLE size_category (
  size_category_id SERIAL PRIMARY KEY,
  category_name VARCHAR(100) NOT NULL
);

-- Size Option Table
CREATE TABLE size_option (
  size_option_id SERIAL PRIMARY KEY,
  size_name VARCHAR(50) NOT NULL,
  size_category_id INT NOT NULL,
  FOREIGN KEY (size_category_id) REFERENCES size_category(size_category_id)
);

-- Product Table
CREATE TABLE product (
  product_id SERIAL PRIMARY KEY,
  name VARCHAR(255) NOT NULL,
  description TEXT,
  brand_id INT NOT NULL,
  category_id INT NOT NULL,
  base_price DECIMAL(10,2) NOT NULL,
  FOREIGN KEY (brand_id) REFERENCES brand(brand_id),
  FOREIGN KEY (category_id) REFERENCES product_category(category_id)
);

-- Product Variation Table
CREATE TABLE product_variation (
  variation_id SERIAL PRIMARY KEY,
  product_id INT NOT NULL,
  color_id INT NOT NULL,
  size_option_id INT NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(product_id),
  FOREIGN KEY (color_id) REFERENCES color(color_id),
  FOREIGN KEY (size_option_id) REFERENCES size_option(size_option_id)
);

-- Product Item Table
CREATE TABLE product_item (
  item_id SERIAL PRIMARY KEY,
  variation_id INT NOT NULL,
  sku VARCHAR(100) NOT NULL,
  price_override DECIMAL(10,2),
  stock_quantity INT NOT NULL DEFAULT 0,
  FOREIGN KEY (variation_id) REFERENCES product_variation(variation_id)
);

-- Product Image Table
CREATE TABLE product_image (
  image_id SERIAL PRIMARY KEY,
  product_id INT NOT NULL,
  image_url VARCHAR(500) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(product_id)
);

-- Attribute Category Table
CREATE TABLE attribute_category (
  attribute_category_id SERIAL PRIMARY KEY,
  category_name VARCHAR(100) NOT NULL
);

-- Attribute Type Table
CREATE TABLE attribute_type (
  attribute_type_id SERIAL PRIMARY KEY,
  type_name VARCHAR(50) NOT NULL  
);

-- Product Attribute Table
CREATE TABLE product_attribute (
  attribute_id SERIAL PRIMARY KEY,
  product_id INT NOT NULL,
  attribute_category_id INT NOT NULL,
  attribute_type_id INT NOT NULL,
  name VARCHAR(100) NOT NULL,
  value VARCHAR(255) NOT NULL,
  FOREIGN KEY (product_id) REFERENCES product(product_id),
  FOREIGN KEY (attribute_category_id) REFERENCES attribute_category(attribute_category_id),
  FOREIGN KEY (attribute_type_id) REFERENCES attribute_type(attribute_type_id)
);
