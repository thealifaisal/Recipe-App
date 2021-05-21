import React from "react";
import RecipeItem from '../../components/RecipeItem/RecipeItem';
import ViewRecipe from '../../components/ViewRecipe/ViewRecipe';
import withContext from "../../withContext";

const RecipeList = props => {
  const { recipe } = props.context;
  var itemName = props.context.selectedItem;
  return !itemName? (
    <>
      <div className="hero is-primary" style={{background:"#B83C82", color:"white"}}>
        <div className="hero-body container">
          <h4 className="title">Our Recipes</h4>
        </div>
      </div>
      
      <br />

      <div className="container">
        <div className="column columns is-multiline">
          {recipe && recipe.length ? (
            recipe.map((product, index) => (
              <RecipeItem
                recipe={product}
                key={index}
                addToLikeList={props.context.addToLikeList}
                select = {props.context.select}
              />
            ))
          ) : (
            <div className="column">
              <span className="title has-text-grey-light">
                No recipe found!
              </span>
            </div>
          )}
        </div>
      </div>
    </>
  ): <ViewRecipe name={itemName}/>;
};

export default withContext(RecipeList);