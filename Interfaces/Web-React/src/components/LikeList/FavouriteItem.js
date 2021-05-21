import React from "react";

const CartItem = props => {
  const { item, likeListKey } = props;

  const  recipe = item;
  return (
    <div className=" column is-half">
      <div className="box">
        <div className="media">
          <div className="media-left">
            <figure className="image is-64x64">
              <img
                src="https://bulma.io/images/placeholders/128x128.png"
                alt={recipe.shortDesc}
              />
            </figure>
          </div>
          <div className="media-content">
            <b style={{ textTransform: "capitalize" }}>
              {recipe.name}{" "}
              <span className="tag is-primary">{recipe.cuisine}</span>
            </b>
            <div>{recipe.shortDesc}</div>
          </div>
          <div
            className="media-right"
            onClick={() => props.removeFromCart(likeListKey)}
          >
            <span className="delete is-large"></span>
          </div>
        </div>
      </div>
    </div>
  );
};

export default CartItem;
