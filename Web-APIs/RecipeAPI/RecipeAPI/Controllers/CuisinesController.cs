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
    public class CuisinesController : ControllerBase
    {
        private readonly RecipeDatabaseContext _context;

        public CuisinesController(RecipeDatabaseContext context)
        {
            _context = context;
        }

        // GET: api/Cuisines
        [HttpGet]
        public async Task<ActionResult<IEnumerable<Cuisine>>> GetCuisine()
        {
            return await _context.Cuisine.ToListAsync();
        }

        // GET: api/Cuisines/5
        [HttpGet("{id}")]
        public async Task<ActionResult<Cuisine>> GetCuisine(int id)
        {
            var cuisine = await _context.Cuisine.FindAsync(id);

            if (cuisine == null)
            {
                return NotFound();
            }

            return cuisine;
        }

        // PUT: api/Cuisines/5
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPut("{id}")]
        public async Task<IActionResult> PutCuisine(int id, Cuisine cuisine)
        {
            if (id != cuisine.Id)
            {
                return BadRequest();
            }

            _context.Entry(cuisine).State = EntityState.Modified;

            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!CuisineExists(id))
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

        // POST: api/Cuisines
        // To protect from overposting attacks, enable the specific properties you want to bind to, for
        // more details, see https://go.microsoft.com/fwlink/?linkid=2123754.
        [HttpPost]
        public async Task<ActionResult<Cuisine>> PostCuisine(Cuisine cuisine)
        {
            _context.Cuisine.Add(cuisine);
            try
            {
                await _context.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (CuisineExists(cuisine.Id))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtAction("GetCuisine", new { id = cuisine.Id }, cuisine);
        }

        // DELETE: api/Cuisines/5
        [HttpDelete("{id}")]
        public async Task<ActionResult<Cuisine>> DeleteCuisine(int id)
        {
            var cuisine = await _context.Cuisine.FindAsync(id);
            if (cuisine == null)
            {
                return NotFound();
            }

            _context.Cuisine.Remove(cuisine);
            await _context.SaveChangesAsync();

            return cuisine;
        }

        private bool CuisineExists(int id)
        {
            return _context.Cuisine.Any(e => e.Id == id);
        }
    }
}
