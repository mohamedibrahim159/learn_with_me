# **App Name**: EduKids

## Core Features:

- Educational Content: Implement educational content sections for letters, numbers, animals, colors, and stories.
- Localization: Support Arabic and English for the UI. (content from API is fixed).
- User Sections: Implement "For Parents" and "For Learners" sections.
- Firebase Authentication: Integrate Firebase Authentication for login (anonymous guest login).
- Responsive UI: Fully responsive UI across all screen sizes (phones, tablets).

## Style Guidelines:

- Primary color: Soft pastel blue (#A7D1FF) for a calm learning environment.
- Secondary color: Light pastel green (#B7E1CD) to represent growth and development.
- Accent: Yellow (#FFECB3) for interactive elements and highlights.
- Clear and readable fonts optimized for young children.
- Friendly and intuitive icons for easy navigation.
- Clean and uncluttered layouts to minimize distractions.
- Subtle, engaging animations to enhance interactivity.

## Original User Request:
Create a complete Flutter educational app for children called "Learn With Me" using Clean Architecture and integrated with Firebase.

The design is based on this Adobe XD link:  
https://xd.adobe.com/view/8de0da38-3f06-4036-8ee3-3cd1881f119d-d8b3/

App Requirements:
- Educational content sections: Letters, Numbers, Animals, Colors, and Stories.
- The app should support both Arabic and English for the UI (the actual content from API remains fixed).
- There are two main user sections: "For Parents" and "For Learners".
- Include screens that will later fetch audio content from an external API.
- The UI must be fully responsive across all screen sizes (phones, tablets).
- Use Firebase Authentication for login (preferably anonymous guest login).
- Use mock data for now until the real API is ready.
- Implement localization using AR and EN (arabic/english).
- Use **BLoC/Cubit** for state management (not Riverpod or Provider).
- Apply Clean Architecture: separate layers for Domain, Data, and Presentation.
- Include a `README.md` explaining how to run the project.
- The project should be ready to run after cloning, and prepared for GitHub deployment.
  