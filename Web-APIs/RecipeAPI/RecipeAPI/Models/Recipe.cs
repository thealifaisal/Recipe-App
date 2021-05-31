using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace RecipeAPI.Models
{
    public partial class Recipe
    {
        public Recipe()
        {
            Favorites = new HashSet<Favorites>();
            RecipeDirection = new HashSet<RecipeDirection>();
            RecipeIngredient = new HashSet<RecipeIngredient>();
        }

        public int Id { get; set; }
        public string Name { get; set; }

        #nullable enable
        public byte[]? Image { get; set; }
        #nullable disable

        public string Description { get; set; }
        public int? CuisineId { get; set; }
        public string UserId { get; set; }

        public virtual Cuisine Cuisine { get; set; }
        public virtual User User { get; set; }
        public virtual ICollection<Favorites> Favorites { get; set; }
        public virtual ICollection<RecipeDirection> RecipeDirection { get; set; }
        public virtual ICollection<RecipeIngredient> RecipeIngredient { get; set; }
    }
}
