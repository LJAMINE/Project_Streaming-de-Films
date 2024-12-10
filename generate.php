```
<?php
require 'vendor/autoload.php'; // Make sure Faker is installed via Composer

use Faker\Factory;

// Configuration de la base de données
$host = 'localhost';
$dbname = 'moviesproject';
$username = 'root';
$password = '';

// Connexion à la base de données MySQL avec MySQLi
$conn = new mysqli($host, $username, $password, $dbname);

// Vérification de la connexion
if ($conn->connect_error) {
    die("Connexion échouée : " . $conn->connect_error);
}

// Nombre de données factices à générer
$numberOfUsers = 10; // Modifier selon le besoin
$numberOfMovies = 5; 
$numberOfWatchHistory = 15; 
$numberOfReviews = 20;

// Initialisation de Faker
$faker = Factory::create();

// Insertion des données factices dans Subscription
$subscriptions = [
    ['Basic', 5.99],
    ['Premium', 11.99],
    ['Family', 19.99]
];

foreach ($subscriptions as $index => $subscription) {
    $stmt = $conn->prepare("INSERT IGNORE INTO Subscription ( subscription_Type, monthlyFee) VALUES ( ?, ?)");
    $stmt->bind_param('sd', $subscription[0], $subscription[1]);
    $stmt->execute();
    $stmt->close();
}

// Générer des utilisateurs factices
for ($i = 1; $i <= $numberOfUsers; $i++) {
    $first_name = $faker->first_name;
    $last_name = $faker->last_name;
    $email = $faker->unique()->safeEmail;
    $registration_date = $faker->date;
    $subscription_ID = $faker->numberBetween(1, count($subscriptions));

    $stmt = $conn->prepare("INSERT INTO User ( first_name, last_name, Email, registration_date, subscription_ID) VALUES ( ?, ?, ?, ?, ?)");
    $stmt->bind_param('ssssi', $first_name, $last_name, $email, $registration_date, $subscription_ID);
    $stmt->execute();
    $stmt->close();
}

// Générer des films factices
for ($i = 1; $i <= $numberOfMovies; $i++) {
    $title = $faker->sentence(3);
    $genre = $faker->randomElement(['Comedy', 'Horror', 'Romance', 'Science Fiction', 'Documentary']);
    $release_Year = $faker->year;
    $duration = $faker->numberBetween(80, 180); // Durée entre 80 et 180 minutes
    $rating = $faker->randomElement(['PG', 'PG-13', 'R']);

    $stmt = $conn->prepare("INSERT INTO Movie ( title, genre, release_Year, duration, rating) VALUES ( ?, ?, ?, ?, ?)");
    $stmt->bind_param('isssis', $title, $genre, $release_Year, $duration, $rating);
    $stmt->execute();
    $stmt->close();
}

// Générer des historiques de visionnage factices
for ($i = 1; $i <= $numberOfWatchHistory; $i++) {
    $user_ID = $faker->numberBetween(1, $numberOfUsers);
    $movie_ID = $faker->numberBetween(1, $numberOfMovies);
    $watch_date = $faker->date;
    $completion_Percentage = $faker->numberBetween(0, 100);

    $stmt = $conn->prepare("INSERT INTO WatchHistory ( user_ID, movie_ID, watch_date, completion_Percentage) VALUES ( ?, ?, ?, ?)");
    $stmt->bind_param('iiisi', $user_ID, $movie_ID, $watch_date, $completion_Percentage);
    $stmt->execute();
    $stmt->close();
}

// Générer des critiques factices
for ($i = 1; $i <= $numberOfReviews; $i++) {
    $user_ID = $faker->numberBetween(1, $numberOfUsers);
    $movie_ID = $faker->numberBetween(1, $numberOfMovies);
    $rating = $faker->numberBetween(1, 5);
    $review_Text = $faker->optional()->sentence(10);
    $review_Date = $faker->date;

    $stmt = $conn->prepare("INSERT INTO Review ( user_ID, movie_ID, rating, review_Text, review_Date) VALUES (?, ?, ?, ?, ?)");
    $stmt->bind_param('iiisis', $user_ID, $movie_ID, $rating, $review_Text, $review_Date);
    $stmt->execute();
    $stmt->close();
}

echo "Fake data inserted successfully!";

// Fermer la connexion
$conn->close();
?>

```