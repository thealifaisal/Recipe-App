import React, { Component } from "react";
import withContext from "../../withContext";
import { Redirect } from "react-router-dom";
import createFragment from 'react-addons-create-fragment';
import axios from 'axios';
import TagInput from '../../components/TagInput/TagInput';

const initState = {
  name: "",
  cuisine: "",
  shortDesc: "",
  description: ""
};

class AddProduct extends Component {

  constructor(props) {
    super(props);
    this.state = initState;
  }

  save = async (e) => {
    e.preventDefault();
    const { name, cuisine, shortDesc, description } = this.state;

    if (name ) {
      const id = Math.random().toString(36).substring(2) + Date.now().toString(36);

      await axios.post(
        'http://localhost:3001/recipe',
        { id, name, cuisine, shortDesc, description },
      )

      this.props.context.addRecipe(
        {
          name,
          shortDesc,
          description,
          cuisine: cuisine || 0
        },
        () => this.setState(initState)
      );
      this.setState(
        { flash: { status: 'is-success', msg: 'Product created successfully' }}
      );

    } else {
      this.setState(
        { flash: { status: 'is-danger', msg: 'Please enter name!' }}
      );
    }
  };

  handleChange = e => this.setState({ [e.target.name]: e.target.value, error: "" });

  render() {
    const { name, cuisine, shortDesc, description } = this.state;
    const { user } = this.props.context;
    const selectedTags = tags => console.log(tags);

    return (
      <>
        <div className="hero is-primary " style={{background:'#B83C82'}}>
          <div className="hero-body container">
            <h4 className="title">Add Recipe</h4>
          </div>
        </div>
        <br />
        <br />
        <form onSubmit={this.save}>
          <div className="columns is-mobile is-centered">
            <div className="column is-one-third">
              <div className="field">
                <label className="label">Recipe Name: </label>
                <input
                  className="input"
                  type="text"
                  name="name"
                  value={name}
                  onChange={this.handleChange}
                  required
                />
              </div>
              
              <div className="field">
                <label className="label">Cuisine: </label>
                <input
                  className="input"
                  type="number"
                  name="cuisine"
                  value={cuisine}
                  onChange={this.handleChange}
                />
              </div>
              <div className="field">
                <label className="label">Ingredients: </label>
                <TagInput className="input" display="default" selectedTags={selectedTags}  description= "" tags={['Onions', 'Oils']}/>
              </div>
              
              <div className="field">
                <label className="label">Steps: </label>
                <TagInput className="textarea" display="block" selectedTags={selectedTags}  description= "" tags={[]}/>
 
              </div>
              <div className="field">
                    <label className="label">Photo:</label>
                    <input type="file" id="img" className="input" name="img" accept="image/*"onChange={this.handleChange}/>
                  </div>
              <div className="field is-clearfix">
                <button
                  className="button is-primary is-pulled-right"
                  type="submit"
                  onClick={this.save}
                  style={{background:"#B83C82", color:"white"}}
                >
                  Add
                </button>
              </div>
            </div>
          </div>
        </form>
      </>
    );
  }
}

export default withContext(AddProduct);