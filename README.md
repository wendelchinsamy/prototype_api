# Prototype API

## Get Started

### System Requirements
1. Docker Desktop
2. Postgresql

#### 1. Installing Docker Desktop
- The project makes use of Docker and Docker Compose.
- Install instructions for Docker Desktop on Mac can be found here -> https://docs.docker.com/desktop/install/mac-install
- The install guide for Docker Desktop on Windows can be found here -> https://docs.docker.com/desktop/install/windows-install

#### 2. Interacting with the Image
- While in the application root directory you can you may execute the following from your terminal:
    - build the container `docker compose build prototype-api`
    - start and attach the container `docker compose up prototype-api`
    - build and start at the same time `docker compose up --build prototype-api`
    - access the bash command within the container `docker compose run prototype-api bash`
      - within bash you can execute the application specs `rspec`
  
### 3. Building the Database
- The application uses environment variables to store database connection settings
- Changing the `.env` file field values to your own values is required
- Alternatively could update the `config/database.yml` file directly
- The database will need to be built before running the application
- While in the application root directory
  - access the bash command in the container `docker compose run prototype-api bash`
  - create the database `rails db:create`
  - run the database migrations `rails db:migrate`
  - install initial data `rails db:seed`

### 4. Interacting with the API
- The API is exposed at `localhost:3000`
- The port is set in the `docker-compose.yml` file and can be changed to any port you desire
- A Postman collection has been added to the repo i.e. `prototype-api.postman_collection.json` for your convenience
