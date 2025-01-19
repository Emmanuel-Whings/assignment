# Flutter Developer Assignment  

This Flutter app demonstrates:  

- Routing with `go_router`.  
- State management using `bloc`.  
- Graceful error handling and performance optimization.  

## Features  

1. **Screen 1: List of Items**  
   - Fetches data from (https://raw.githubusercontent.com/Emmanuel-Whings/test/refs/heads/main).  
   - Handles loading, error, and empty states.  
2. **Screen 2: Item Details**  
   - Displays details of a selected item.  

## Installation  

1. Clone the repository:  
   ```bash  
   gh repo clone Emmanuel-Whings/assignment
   cd flutter-developer-assignment  
   ```  
2. Install dependencies:  
   ```bash  
   flutter pub get  
   ```  
3. Run the app:  
   ```bash  
   flutter run  
   ```  

## Approach  

- Used `bloc` for predictable state management.  
- `go_router` ensures smooth navigation.  
- Modularized code into layers (data, bloc, presentation).  
- Optimized for performance and user experience.  

## Challenges  

- Handled API errors with retry options.  
- Implemented caching and optimized widget rebuilds.  

## Repository  

Find the full project here: [GitHub Repo](https://github.com/your-username/flutter-developer-assignment).  

## Contact  

Questions? Reach out via:  
- Email: [emmanueldodoh7@gmail.com]  

Let me know if you need further tweaks!
