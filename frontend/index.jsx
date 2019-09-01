import React from 'react';
import ReactDOM from 'react-dom';
import Root from './components/root';

//WINDOW TESTING
import { postUser, postSession, deleteSession } from './util/user_api_util';

window.postUser = postUser;
window.postSession = postSession;
window.deleteSession = deleteSession;

//


document.addEventListener("DOMContentLoaded", () => {
    const root = document.getElementById("root");
    ReactDOM.render(<Root />, root)
})