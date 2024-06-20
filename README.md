# URL Shortener

This is a URL shortener application built with Ruby on Rails. The application includes URL shortening, metadata retrieval, URL statistics, and user authentication and permissions. Key features include:

- **URL Shortening**: Shorten long URLs.
- **Metadata Retrieval**: Uses a background job to retrieve and display metadata (description, title, and image) for each URL.
- **URL Statistics**: Stores and displays detailed statistics for each URL, including the number of views, agent name, and IP address of each view. These statistics are visualized using charts.
- **Pagination**: Utilizes Pagy for paginating lists of URLs.
- **User Authentication and Permissions**: Uses Devise to handle user authentication, ensuring that users can only edit their own URLs.
