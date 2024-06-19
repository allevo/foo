CREATE TABLE users (
    user_id SERIAL PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    password VARCHAR(50) NOT NULL
);

CREATE TABLE notes (
    note_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE notes_elements (
    note_id SERIAL PRIMARY KEY,
    progressive INT NOT NULL
    type INT NOT NULL,
    task_id INT,
    event_id INT,
    FOREIGN KEY (note_id) REFERENCES notes(note_id),
    FOREIGN KEY (task_id) REFERENCES tasks(task_id),
    FOREIGN KEY (event_id) REFERENCES events(event_id)
);

CREATE TABLE shared_notes (
    note_id INT NOT NULL,
    shared_user_id INT NOT NULL,
    FOREIGN KEY (note_id) REFERENCES notes(note_id),
    FOREIGN KEY (shared_user_id) REFERENCES users(user_id)
);

CREATE TABLE tasks (
    task_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    task_text TEXT,
    due_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE shared_tasks (
    task_id INT NOT NULL,
    shared_user_id INT NOT NULL,
    FOREIGN KEY (task_id) REFERENCES tasks(task_id),
    FOREIGN KEY (shared_user_id) REFERENCES users(user_id)
);

CREATE TABLE events (
    event_id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    event_name VARCHAR(100),
    event_date DATE,
    FOREIGN KEY (user_id) REFERENCES users(user_id)
);

CREATE TABLE shared_events (
    event_id INT NOT NULL,
    shared_user_id INT NOT NULL,
    FOREIGN KEY (event_id) REFERENCES events(event_id),
    FOREIGN KEY (shared_user_id) REFERENCES users(user_id)
);