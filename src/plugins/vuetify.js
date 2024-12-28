// src/plugins/vuetify.js

import { createVuetify } from 'vuetify';
import 'vuetify/styles'; // Estilos base de Vuetify
import '@mdi/font/css/materialdesignicons.css'; // Íconos de Material Design

// Tema personalizado
const myTheme = {
  dark: false,
  colors: {
    primary: '#6200ea', // Cambia según tus necesidades
    secondary: '#03dac6',
    background: '#f5f5f5',
    surface: '#ffffff',
    error: '#b00020',
    success: '#4caf50',
  },
};

export default createVuetify({
  theme: {
    defaultTheme: 'myTheme',
    themes: {
      myTheme,
    },
  },
});
