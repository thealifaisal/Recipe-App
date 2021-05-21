import React from "react";
import withContext from "../../withContext";

const TagInput = props => {
  const [tags, setTags] = React.useState(props.tags);
  const removeTags = indexToRemove => {
    setTags([...tags.filter((_, index) => index !== indexToRemove)]);
  };
  const addTags = event => {
    if (event.target.value !== "") {
      setTags([...tags, event.target.value]);
      props.selectedTags([...tags, event.target.value]);
      event.target.value = "";
    }
  };
  return (
    <div className="tags-input">
      <ul id="tags">
        {tags.map((tag, index) => (
          <li key={index} className="tag" style={{marginRight:"10px", marginBottom:"10px", display:props.display}}>
            <span className='tag-title'>{tag}</span>
            <span className='tag-close-icon'
              onClick={() => removeTags(index)} style={{float:"right", marginLeft:"10px" ,cursor: "pointer"}}
            >
              x
            </span>
          </li>
        ))}
      </ul>
      <input
        className={props.className}
        type="text"
        onKeyUp={event => event.key === "Enter" ? addTags(event) : null}
        placeholder={props.description}
      />
    </div>
  );
};

export default withContext(TagInput);