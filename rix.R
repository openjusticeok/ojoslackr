# rix environment configuration for ojoslackr package
# This file generates Nix expressions for reproducible R environments
#
# Usage:
# 1. Install rix if not already installed: install.packages("rix")
# 2. Run this script: source("rix.R")
# 3. Use the generated nix files to create reproducible environments

# Load the rix package
library(rix)

cat("=== Creating ojoslackr Runtime Environment ===\n")
cat("This environment includes packages needed to use ojoslackr\n\n")

# Package runtime environment
# This environment includes only the packages needed to use ojoslackr
rix(
  r_ver = "latest",
  r_pkgs = c(
    # Core package dependencies (from DESCRIPTION Imports)
    "ggplot2",
    "grid", 
    "slackr",
    # Common usage dependencies (from vignette)
    "here",
    "tidyverse"
  ),
  system_pkgs = NULL,
  git_pkgs = list(
    list(
      package_name = "ojodb",
      repo_url = "https://github.com/openjusticeok/ojodb",
      branch_name = "main"
    ),
    list(
      package_name = "ojoslackr",
      repo_url = "https://github.com/openjusticeok/ojoslackr",
      branch_name = "main"
    )
  ),
  ide = "other",
  project_path = ".",
  overwrite = TRUE,
  print = TRUE,
  shell_hook = "# Runtime environment for ojoslackr\n# Use: nix-shell default.nix"
)

cat("\n=== Creating ojoslackr Development Environment ===\n")
cat("This environment includes all packages needed for package development\n\n")

# Package development environment  
# This environment includes all packages needed for package development
rix(
  r_ver = "latest",
  r_pkgs = c(
    # Runtime dependencies (from DESCRIPTION Imports)
    "ggplot2",
    "grid",
    "slackr",
    # Suggested dependencies (from DESCRIPTION Suggests)
    "devtools",
    "here", 
    "httpgd",
    "knitr",
    "languageserver",
    "rmarkdown",
    "testthat",
    "tidyverse",
    "usethis",
    # Additional development tools for R package development
    "roxygen2",
    "pkgdown",
    "covr",
    "styler",
    "lintr"
  ),
  system_pkgs = NULL,
  git_pkgs = list(
    list(
      package_name = "ojodb", 
      repo_url = "https://github.com/openjusticeok/ojodb",
      branch_name = "main"
    )
  ),
  ide = "rstudio",
  project_path = ".",
  overwrite = FALSE,
  print = TRUE,
  shell_hook = "# Development environment for ojoslackr\n# Use: nix-shell shell.nix\n# Includes RStudio and all development tools"
)

cat("\n=== rix configuration complete ===\n")
cat("Generated files:\n")
cat("  - default.nix: Runtime environment\n")
cat("  - shell.nix: Development environment with RStudio\n")
cat("\nTo use:\n")
cat("  nix-shell default.nix  # Runtime environment\n")
cat("  nix-shell shell.nix    # Development environment\n")