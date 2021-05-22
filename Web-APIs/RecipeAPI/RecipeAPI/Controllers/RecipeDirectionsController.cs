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
    public class RecipeDirectionsController : ControllerBase
    {
        private readonly RecipeDatabaseContext _context;

        public RecipeDirectionsController(RecipeDatabaseContext context)
        {
            _context = context;
        }

        // GET: api/RecipeDirections
        [HttpGet]
        public async Task<ActionResult<IEnumerable<RecipeDirection>>> GetRecipeDirection()
        {
            return await _context.RecipeDirection.ToListAsync();
        }

        // GET: api/RecipeDirections/5
        [HttpGet("{id}")]
        public async Task<ActionResult<RecipeDirection>> GetRecipeDirection(int id)
        {
            var recipeDirection = await _context.RecipeDirection.FindAsync(id);

            if (recipeDirection == null)
            {
                return NotFound();
            }

            return recipeDirection;
        }

        // PUT: api/RecipeDirections/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutRecipeDirection(int id, RecipeDirection recipeDirection)
        {
            if (id != recipeDirection.Id)
            {
                return BadRequest();
            }

            _context.Entry(recipeDirection).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!RecipeDirectionExists(id))
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

        // POST: api/RecipeDirections
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<RecipeDirection>> PostRecipeDirection(RecipeDirection recipeDirection)
        {
            _context.RecipeDirection.Add(recipeDirection);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (RecipeDirectionExists(recipeDirection.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetRecipeDirection", new { id = recipeDirection.Id }, recipeDirection);
        }

        // DELETE: api/RecipeDirections/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<RecipeDirection>> DeleteRecipeDirection(int id)
        {
            var recipeDirection = await _context.RecipeDirection.FindAsync(id);
            if (recipeDirection == null)
            {
                return NotFound();
            }

            _context.RecipeDirection.Remove(recipeDirection);
            await _context.SaveChangesAsync();

            return recipeDirection;
        }

        private bool RecipeDirectionExists(int id)
        {
            return _context.RecipeDirection.Any(e => e.Id == id);
        }
    }
}
