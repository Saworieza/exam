import { createStore, applyMiddleware, compose } from 'redux';
import createLogger from 'redux-logger';
import { persistState } from 'redux-devtools';
import DevTools from './utils/DevTools';
import { reduxReactRouter } from 'redux-react-router';
import { createHistory } from 'history';
import thunk from 'redux-thunk';
import routes from './routes';
import rootReducer from './reducer';

export default function configureStore(initialState) {
  let createStoreWithMiddleware;

  const logger = createLogger();

  const middleware = applyMiddleware(thunk, logger);

  if (__DEVTOOLS__) {
    createStoreWithMiddleware = compose(
     middleware,
     reduxReactRouter({routes, createHistory}),
     DevTools.instrument(),
     persistState(window.location.href.match(/[?&]debug_session=([^&]+)\b/))
    );
  } else {
    createStoreWithMiddleware = compose(
     middleware,
     reduxReactRouter({routes, createHistory})
    );
  }


  const store = createStoreWithMiddleware(createStore)(rootReducer, initialState);

  if (module.hot) {
    // Enable Webpack hot module replacement for reducers
    module.hot.accept('./reducer', () => {
      const nextReducer = require('./reducer');
      store.replaceReducer(nextReducer);
    });
  }

  return store;
}
