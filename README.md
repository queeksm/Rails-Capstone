# Scaffold for the Rails capstone project.

This repo contains the barebones of a transactional management application, the functionality if operational and you can expand on it. It also has some basic styling using bootstrap 4. Added the option to edit and delete the transactions within my transactions and my external transactions sections.

The ERD model shows a Many to Many relationship between the groups and the transactions(Bdrafts), this is implemented on the Active record however the functionality is not fully used within the application, but it can be expanded on the future, that's why it's implemented on the active record.

## Built With

- Ruby v2.7.0
- Ruby on Rails v5.2.4
- Bootstrap 4

## Live Demo

https://intense-anchorage-26906.herokuapp.com/

## Getting Started

You can get a local copy working by cloning this repo to your pc

### Prerequisites

Ruby: 2.6.3
Rails: 5.2.3
Postgres: >=9.5

### Setup

Instal gems with:

```
bundle install
```

Setup database with:

```
   rails db:create
   rails db:migrate
```



### Usage

Start server with:

```
    rails server
```

Open `http://localhost:3000/` in your browser.

### Run tests

```
    rpsec --format documentation
```


## Authors

Andres Felipe Perez Restrepo

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](issues/).

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

Thanks to Microverse.
Thanks to Gregoire Vella for the inspiration on the design of the app.
Checkout the original desing here: https://www.behance.net/gallery/19759151/Snapscan-iOs-design-and-branding

## 📝 License

MIT
