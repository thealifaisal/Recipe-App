using System;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.Metadata;

// Code scaffolded by EF Core assumes nullable reference types (NRTs) are not used or disabled.
// If you have enabled NRTs for your project, then un-comment the following line:
// #nullable disable

namespace RecipeAPI.Models
{
    public partial class RecipeDatabaseContext : DbContext
    {
        public RecipeDatabaseContext(DbContextOptions<RecipeDatabaseContext> options)
            : base(options)
        {
        }

        public virtual DbSet<Cuisine> Cuisine { get; set; }
        public virtual DbSet<Favorites> Favorites { get; set; }
        public virtual DbSet<Ingredient> Ingredient { get; set; }
        public virtual DbSet<Recipe> Recipe { get; set; }
        public virtual DbSet<RecipeDirection> RecipeDirection { get; set; }
        public virtual DbSet<RecipeIngredient> RecipeIngredient { get; set; }
        public virtual DbSet<User> User { get; set; }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Cuisine>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Favorites>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.RecipeId).HasColumnName("RecipeID");

                entity.Property(e => e.UserId)
                    .IsRequired()
                    .HasColumnName("UserID")
                    .HasMaxLength(100);

                entity.HasOne(d => d.Recipe)
                    .WithMany(p => p.Favorites)
                    .HasForeignKey(d => d.RecipeId)
                    .HasConstraintName("FK_Favorites_Recipe");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Favorites)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.ClientSetNull)
                    .HasConstraintName("FK_Favorites_User");
            });

            modelBuilder.Entity<Ingredient>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);
            });

            modelBuilder.Entity<Recipe>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.CuisineId).HasColumnName("CuisineID");

                entity.Property(e => e.Description)
                    .HasMaxLength(300)
                    .IsUnicode(false);

                entity.Property(e => e.Image).HasColumnType("image");

                entity.Property(e => e.Name)
                    .IsRequired()
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.UserId)
                    .HasColumnName("UserID")
                    .HasMaxLength(100);

                entity.HasOne(d => d.Cuisine)
                    .WithMany(p => p.Recipe)
                    .HasForeignKey(d => d.CuisineId)
                    .OnDelete(DeleteBehavior.SetNull)
                    .HasConstraintName("FK_Recipe_Cuisine");

                entity.HasOne(d => d.User)
                    .WithMany(p => p.Recipe)
                    .HasForeignKey(d => d.UserId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK_Recipe_User");
            });

            modelBuilder.Entity<RecipeDirection>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.RecipeId).HasColumnName("RecipeID");

                entity.Property(e => e.StepDescription)
                    .IsRequired()
                    .HasMaxLength(100)
                    .IsUnicode(false);

                entity.HasOne(d => d.Recipe)
                    .WithMany(p => p.RecipeDirection)
                    .HasForeignKey(d => d.RecipeId)
                    .OnDelete(DeleteBehavior.Cascade)
                    .HasConstraintName("FK_RecipeDirection_Recipe");
            });

            modelBuilder.Entity<RecipeIngredient>(entity =>
            {
                entity.Property(e => e.Id).HasColumnName("ID");

                entity.Property(e => e.IngredientId).HasColumnName("IngredientID");

                entity.Property(e => e.RecipeId).HasColumnName("RecipeID");

                entity.HasOne(d => d.Ingredient)
                    .WithMany(p => p.RecipeIngredient)
                    .HasForeignKey(d => d.IngredientId)
                    .HasConstraintName("FK_RecipeIngredient_Ingredient");

                entity.HasOne(d => d.Recipe)
                    .WithMany(p => p.RecipeIngredient)
                    .HasForeignKey(d => d.RecipeId)
                    .HasConstraintName("FK_RecipeIngredient_Recipe");
            });

            modelBuilder.Entity<User>(entity =>
            {
                entity.HasKey(e => e.Email);

                entity.Property(e => e.Email).HasMaxLength(100);

                entity.Property(e => e.Name)
                    .HasMaxLength(50)
                    .IsUnicode(false);

                entity.Property(e => e.Password)
                    .IsRequired()
                    .HasMaxLength(16);
            });

            OnModelCreatingPartial(modelBuilder);
        }

        partial void OnModelCreatingPartial(ModelBuilder modelBuilder);
    }
}
