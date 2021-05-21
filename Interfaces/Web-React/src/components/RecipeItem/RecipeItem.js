import React from "react";
import withContext from "../../withContext";

const RecipeItem = props => {
  const { recipe } = props;
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
            <b style={{ textTransform: "capitalize" }} onClick={() =>
                  props.select({
                    name: recipe.name
                  })
                }>
              {recipe.name}{" "}
              <span className="tag is-primary">{recipe.cuisine}</span>
            </b>
            <div>{recipe.shortDesc}</div>
            <div className="is-clearfix">
              <button
                className="button is-small is-outlined is-primary   is-pulled-right"
                onClick={() =>
                  props.addToLikeList({
                    id: recipe.name,
                    recipe
                  })
                }
              >
                Add to Favourites
              </button>
            </div>
          </div>
        </div>
      </div>
    </div>
  );
};

export default withContext(RecipeItem);