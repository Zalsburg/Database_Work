﻿using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Data.Entity.Infrastructure;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Threading.Tasks;
using System.Web.Http;
using System.Web.Http.Description;
using API.Models;

namespace API.Controllers
{
    public class PetsController : ApiController
    {
        private Entities db = new Entities();

        // GET: api/Pets
        public IQueryable<Pet> GetPets()
        {
            return db.Pets;
        }

        // GET: api/Pets/5
        [ResponseType(typeof(Pet))]
        public async Task<IHttpActionResult> GetPet(int id)
        {
            Pet pet = await db.Pets.FindAsync(id);
            if (pet == null)
            {
                return NotFound();
            }

            return Ok(pet);
        }

        // PUT: api/Pets/5
        [ResponseType(typeof(void))]
        public async Task<IHttpActionResult> PutPet(int id, Pet pet)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            if (id != pet.OwnerId)
            {
                return BadRequest();
            }

            db.Entry(pet).State = EntityState.Modified;

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateConcurrencyException)
            {
                if (!PetExists(id))
                {
                    return NotFound();
                }
                else
                {
                    throw;
                }
            }

            return StatusCode(HttpStatusCode.NoContent);
        }

        // POST: api/Pets
        [ResponseType(typeof(Pet))]
        public async Task<IHttpActionResult> PostPet(Pet pet)
        {
            if (!ModelState.IsValid)
            {
                return BadRequest(ModelState);
            }

            db.Pets.Add(pet);

            try
            {
                await db.SaveChangesAsync();
            }
            catch (DbUpdateException)
            {
                if (PetExists(pet.OwnerId))
                {
                    return Conflict();
                }
                else
                {
                    throw;
                }
            }

            return CreatedAtRoute("DefaultApi", new { id = pet.OwnerId }, pet);
        }

        // DELETE: api/Pets/5
        [ResponseType(typeof(Pet))]
        public async Task<IHttpActionResult> DeletePet(int id)
        {
            Pet pet = await db.Pets.FindAsync(id);
            if (pet == null)
            {
                return NotFound();
            }

            db.Pets.Remove(pet);
            await db.SaveChangesAsync();

            return Ok(pet);
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }

        private bool PetExists(int id)
        {
            return db.Pets.Count(e => e.OwnerId == id) > 0;
        }
    }
}