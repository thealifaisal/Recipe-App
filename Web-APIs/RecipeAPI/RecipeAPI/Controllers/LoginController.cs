using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using RecipeAPI.Models;

namespace RecipeAPI.Controllers
{
    [Route("api/[controller]")]
    [ApiController]
    public class LoginController : ControllerBase
    {
        private readonly RecipeDatabaseContext _context;

        public LoginController(RecipeDatabaseContext context)
        {
            _context = context;
        }

        // GET: api/Login/5/123456
        [HttpGet("{id}/{password}")]
        public async Task<ActionResult<User>> AuthUserGET(string id, string password)
        {
            var user = await _context.User.FindAsync(id);

            if (user == null || !user.Password.Equals(password))
            {
                return NotFound();
            }

            return user;
        }
    }
}
