import React, { Component } from "react";
import { Switch, Route, Link, BrowserRouter as Router } from "react-router-dom";

import AddRecipe from './components/AddRecipe/AddRecipe';
import LikeList from './components/LikeList/LikeList';
import Login from './components/Login/Login';
import Signup from './components/Signup/Signup';
import RecipeList from './components/RecipeList/RecipeList';
import axios from 'axios';
import jwt_decode from 'jwt-decode';
import Context from "./Context";
import EditProfile from "./components/EditProfile/EditProfile";






export default class App extends Component {
  constructor(props) {
    super(props);
    this.state = {
      user: null,
      likeList: {},
      recipe: [],
      selectedItem: null
    };
    this.routerRef = React.createRef();
  }

  async componentDidMount() {
    let user = localStorage.getItem("user");
    let cart = localStorage.getItem("likeList");
    const recipe = await axios.get('http://localhost:3001/recipe');
    user = user ? JSON.parse(user) : null;
    cart = cart? JSON.parse(cart) : {};
    this.setState({ user,  recipe: recipe.data, cart});
  }

  login = async(email, password) =>{
    const res = await axios.post(
      'http://localhost:3001/login',
      { email, password },
    ).catch((res) => {
      return { status: 401, message: 'Unauthorized' }
    })

    if(res.status === 200) {
      const { email } = jwt_decode(res.data.accessToken)
      const user = {
        email,
        token: res.data.accessToken,
        accessLevel: email === 'admin@example.com' ? 0 : 1
      }

      this.setState({user});
      console.log({user});
      localStorage.setItem("user", JSON.stringify(user));
      return true;
      } else {
        return false;
      }
    }

  logout = e => {
    e.preventDefault();
    this.setState({ user: null });
    this.setState({likeList: {}});
    localStorage.removeItem("user");
  };

  addToLikeList = item => {
    let likeList = this.state.likeList;
    likeList[item.id] = item.recipe;
    localStorage.setItem("likeList", JSON.stringify(likeList));
    this.setState({ likeList });
  };

  removeFromCart = cartItemId => {
    let likeList = this.state.likeList;
    delete likeList[cartItemId];
    localStorage.setItem("likeList", JSON.stringify(likeList));
    this.setState({ likeList });
  };
  
  clearLikeList = () => {
    let likeList = {};
    localStorage.removeItem("likeList");
    this.setState({ likeList });
  };


  

  addRecipe(recipe, callback){
    let products = this.state.recipe.slice();
    products.push(recipe);
    this.setState({ products }, () => callback && callback());
  };
  select =(name) =>{

    this.setState({selectedItem:name.name});
    console.log(name.name);
    localStorage.setItem("selectedItem", name);
  }
  render() {
    this.componentDidMount();
    return (
      <Context.Provider
        value={{
          ...this.state,
          removeFromLikeList: this.removeFromLikeList,
          addToLikeList: this.addToLikeList,
          login: this.login,
          addRecipe: this.addRecipe,
          clearLikeList: this.clearLikeList,
          checkout: this.checkout,
          select: this.select,
          login: this.login
        }}
      >
        <Router ref={this.routerRef}>
        <div className="App">
          <nav
            className="navbar container"
            role="navigation"
            aria-label="main navigation"
          >
            <div className="navbar-brand">
              <b className="navbar-item is-size-3 ">Cookily</b>
              <label
                role="button"
                class="navbar-burger burger"
                aria-label="menu"
                aria-expanded="false"
                data-target="navbarBasicExample"
                onClick={e => {
                  e.preventDefault();
                  this.setState({ showMenu: !this.state.showMenu });
                }}
              >
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
                <span aria-hidden="true"></span>
              </label>
            </div>
              <div className={`navbar-menu ${
                  this.state.showMenu ? "is-active" : ""
                }`}>
                <Link to="/RecipeList" className="navbar-item" onClick={()=> {this.setState({selectedItem:null});}}>
                  Recipes
                </Link>
               

                                
                {!this.state.user ? (
                  <>
                  <Link to="/login" className="navbar-item is-justify-content-right">
                    Login
                  </Link>
                  <Link to="/signup" className="navbar-item is-justify-content-right">
                    SignUp
                  </Link>
                  </>
                ) : (
                  <>
                  <Link to="/AddRecipe" className="navbar-item">
                    Add Recipes
                  </Link>
                  <Link to="/LikeList" className="navbar-item">
                    Favourites
                    <span
                      className="tag is-danger"
                      style={{ marginLeft: "5px" }}
                      >
                        { Object.keys(this.state.likeList).length }
                    </span>
                  </Link>
                  <Link to={"/EditProfile"} className="navbar-item is-justify-content-right">
                    Edit Profile
                  </Link>
                  <Link to="/" onClick={this.logout} className="navbar-item">
                    Logout
                  </Link>
                  </>
                )}

              </div>
            </nav>
            <Switch>
              <Route exact path="/" component={RecipeList} />
              <Route exact path="/login" component={Login} />
              <Route exact path="/signup" component={Signup} />
              <Route exact path="/LikeList" component={LikeList} />
              <Route exact path="/AddRecipe" component={AddRecipe} />
              <Route exact path="/RecipeList" component={RecipeList} />
              <Route path="/EditProfile" component={EditProfile} />
            </Switch>
          </div>
        </Router>
      </Context.Provider>
    );
  }
}
 // {this.state.user && this.state.user.accessLevel < 1 && (
                //)}