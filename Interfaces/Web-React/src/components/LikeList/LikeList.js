import React from "react";
import { Redirect } from "react-router-dom";
import withContext from "../../withContext";
import CartItem from "./FavouriteItem";

class LikeList extends React.Component {

  render(){
    const { likeList } = this.props.context;
    const props = this.props;
    const likeListKeys = Object.keys(likeList || {});
    return this.props.context.user ? (
        <>
        <div className="hero is-primary " style={{background:'#B83C82'}}>
            <div className="hero-body container">
              <h4 className="title">Favourite Item
              </h4>
            </div>
          </div>
        <br />
        <div className="container">
          {likeListKeys.length ? (
            <div className="column columns is-multiline">
              {likeListKeys.map(key => (
                <CartItem
                  likeListKey={key}
                  key={key}
                  item={likeList[key]}
                  removeFromCart={props.context.removeFromCart}
                />
              ))}
              <div className="column is-12 is-clearfix">
                <br />
                <div className="is-pulled-right">
                  <button
                    onClick={props.context.clearLikeList}
                    className="button is-warning "
                  >
                    Clear
                  </button>{" "}
                </div>
              </div>
            </div>
          ) : (
            <div className="column">
              <div className="title has-text-grey-light">No item in list!</div>
            </div>
          )}
        </div>
      </>
      ) : (
        <Redirect to="/" />
      );
    }
  };

export default withContext(LikeList);
