﻿using System;
using System.Collections.Generic;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace RecipeAPI.Models
{
    public partial class User
    {
        public User()
        {
            Favorites = new HashSet<Favorites>();
            Recipe = new HashSet<Recipe>();
        }

        public string Email { get; set; }
        public string Name { get; set; }
        public string Password { get; set; }

        public virtual ICollection<Favorites> Favorites { get; set; }
        public virtual ICollection<Recipe> Recipe { get; set; }
    }
}
