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
    public class RecipeIngredientsController : ControllerBase
    {
        private readonly RecipeDatabaseContext _context;

        public RecipeIngredientsController(RecipeDatabaseContext context)
        {
            _context = context;
        }

        // GET: api/RecipeIngredients
        [HttpGet]
        public async Task<ActionResult<IEnumerable<RecipeIngredient>>> GetRecipeIngredient()
        {
            return await _context.RecipeIngredient.ToListAsync();
        }

        // GET: api/RecipeIngredients/5
        [HttpGet("{id}")]
        public async Task<ActionResult<RecipeIngredient>> GetRecipeIngredient(int id)
        {
            var recipeIngredient = await _context.RecipeIngredient.FindAsync(id);

            if (recipeIngredient == null)
            {
                return NotFound();
            }

            return recipeIngredient;
        }

        // PUT: api/RecipeIngredients/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutRecipeIngredient(int id, RecipeIngredient recipeIngredient)
        {
            if (id != recipeIngredient.Id)
            {
                return BadRequest();
            }

            _context.Entry(recipeIngredient).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!RecipeIngredientExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return NoContent();
        }

        // POST: api/RecipeIngredients
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<RecipeIngredient>> PostRecipeIngredient(RecipeIngredient recipeIngredient)
        {
            _context.RecipeIngredient.Add(recipeIngredient);
            await _context.SaveChangesAsync();

            return CreatedAtAction("GetRecipeIngredient", new { id = recipeIngredient.Id }, recipeIngredient);
        }

        // DELETE: api/RecipeIngredients/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<RecipeIngredient>> DeleteRecipeIngredient(int id)
        {
            var recipeIngredient = await _context.RecipeIngredient.FindAsync(id);
            if (recipeIngredient == null)
            {
                return NotFound();
            }

            _context.RecipeIngredient.Remove(recipeIngredient);
            await _context.SaveChangesAsync();

            return recipeIngredient;
        }

        private bool RecipeIngredientExists(int id)
        {
            return _context.RecipeIngredient.Any(e => e.Id == id);
        }
    }
}
