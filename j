<html style="--60fps-framerate:60; --betterFeaturedProject-blur:0; --customBlockShape-cornerSize:100; --customBlockShape-notchSize:100; --customBlockShape-paddingSize:100; --customZoom-maxZoom:300; --customZoom-minZoom:30; --customZoom-speed:default; --customZoom-startZoom:68; --customZoom-zoomSpeed:100; --darkWww-selectedMode:experimental-dark; --discussButton-buttonName:Discuss; --editorDarkMode-accent:#151515; --editorDarkMode-activeTab:#202020; --editorDarkMode-border:#ffffff0d; --editorDarkMode-categoryMenu:#202020; --editorDarkMode-fullscreen:#000000; --editorDarkMode-input:#202020; --editorDarkMode-menuBar:#202020; --editorDarkMode-page:#111111; --editorDarkMode-palette:#202020; --editorDarkMode-primary:#4d97ff; --editorDarkMode-selector:#202020; --editorDarkMode-selector2:#202020; --editorDarkMode-selectorSelection:#000000ff; --editorDarkMode-stageHeader:#131313ff; --editorDarkMode-tab:#151515; --editorDarkMode-workspace:#151515; --editorTheme3-PenColor:#0FBD8C; --editorTheme3-controlColor:#FFAB19; --editorTheme3-customColor:#FF6680; --editorTheme3-dataColor:#FF8C1A; --editorTheme3-dataListsColor:#FF661A; --editorTheme3-eventsColor:#FFBF00; --editorTheme3-looksColor:#9966FF; --editorTheme3-motionColor:#4C97FF; --editorTheme3-operatorsColor:#59C059; --editorTheme3-sensingColor:#5CB1D6; --editorTheme3-soundsColor:#CF63CF; --forumQuoteCodeBeautifier-bordercolor:#28A5DA; --hideFlyout-speed:default; --hideFlyout-toggle:hover; --initialiseSpritePosition-x:0; --initialiseSpritePosition-y:0; --liveFeaturedProject-alternativePlayer:none; --onionSkinning-afterTint:#0000FF; --onionSkinning-beforeTint:#FF0000; --onionSkinning-layering:front; --onionSkinning-mode:merge; --onionSkinning-next:0; --onionSkinning-opacity:35; --onionSkinning-opacityStep:10; --onionSkinning-previous:1; --progressBar-height:5; --remixTreeButton-buttonColor:#4d97ff; --scratchNotifier-notification_sound:system-default; --scratchr2-activeColor:#4280d7; --scratchr2-linkColor:#4d97ff; --scratchr2-primaryColor:#4d97ff;" lang="en-US"><div id="scratchaddons-iframes"><iframe id="scratchaddons-iframe-1" style="display: none;"></iframe><iframe id="scratchaddons-iframe-2" style="display: none;"></iframe><iframe id="scratchaddons-iframe-3" style="display: none;"></iframe><iframe id="scratchaddons-iframe-4" style="display: none;"></iframe></div><script async="" src="//www.google-analytics.com/analytics.js"></script><script src="chrome-extension://fbeffbjdlemaoicjdapfpikkikjoneco/libraries/comlink.js"></script><script type="module" src="chrome-extension://fbeffbjdlemaoicjdapfpikkikjoneco/content-scripts/inject/module.js"></script><script>(function injectRedux() {
  window.__scratchAddonsRedux = {};
  if (typeof window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ !== "undefined") {
    return console.warn("Redux feature is disabled due to conflict.");
  }

  // ReDucks: Redux ducktyped
  // Not actual Redux, but should be compatible
  class ReDucks {
    static compose(...composeArgs) {
      if (composeArgs.length === 0) return (...args) => args;
      return (...args) => {
        const composeArgsReverse = composeArgs.slice(0).reverse();
        let result = composeArgsReverse.shift()(...args);
        for (const fn of composeArgsReverse) {
          result = fn(result);
        }
        return result;
      };
    }

    static applyMiddleware(...middlewares) {
      return (createStore) => (...createStoreArgs) => {
        const store = createStore(...createStoreArgs);
        let { dispatch } = store;
        const api = {
          getState: store.getState,
          dispatch: (action) => dispatch(action),
        };
        const initialized = middlewares.map((middleware) => middleware(api));
        dispatch = ReDucks.compose(...initialized)(store.dispatch);
        return Object.assign({}, store, { dispatch });
      };
    }
  }

  window.__REDUX_DEVTOOLS_EXTENSION_COMPOSE__ = function (...args) {
    const scratchAddonsRedux = window.__scratchAddonsRedux;
    const reduxTarget = (scratchAddonsRedux.target = new EventTarget());
    scratchAddonsRedux.state = {};
    scratchAddonsRedux.dispatch = () => {};

    function middleware({ getState, dispatch }) {
      scratchAddonsRedux.dispatch = dispatch;
      scratchAddonsRedux.state = getState();
      return (next) => (action) => {
        const nextReturn = next(action);
        const ev = new CustomEvent("statechanged", {
          detail: {
            prev: scratchAddonsRedux.state,
            next: (scratchAddonsRedux.state = getState()),
            action,
          },
        });
        reduxTarget.dispatchEvent(ev);
        return nextReturn;
      };
    }
    args.splice(1, 0, ReDucks.applyMiddleware(middleware));
    return ReDucks.compose.apply(this, args);
  };
})()</script><script>(function fixConsole() {
  window._realConsole = {
    ...console,
  };
})()</script><!--<![endif]--><head>
        <meta charset="UTF-8">

        <meta http-equiv="x-ua-compatible" content="ie=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">

        <!-- Prevent mobile Safari from making phone numbers -->
        <meta name="format-detection" content="telephone=no">

        
            <title>Scratch - Imagine, Program, Share</title>

            <!-- Search & Open Graph-->
            <meta name="description" content="Scratch is a free programming language and online community where you can create your own interactive stories, games, and animations.">
            <meta name="google-site-verification" content="m_3TAXDreGTFyoYnEmU9mcKB4Xtw5mw6yRkuJtXRKxM">

            <meta property="og:url" content="https://scratch.mit.edu/">
            <meta property="og:type" content="website">
            <meta property="og:title" content="Scratch - Imagine, Program, Share">
            <meta property="og:description" content="Scratch is a free programming language and online community where you can create your own interactive stories, games, and animations.">
            <meta property="og:image" content="https://scratch.mit.edu/images/scratch-og.png">
            <meta property="og:image:type" content="image/png">
            <meta property="og:image:width" content="986">
            <meta property="og:image:height" content="860">
        

        <!-- Favicon & CSS normalize -->
        <link rel="shortcut icon" href="/favicon.ico">
        <link rel="stylesheet" href="/css/lib/normalize.min.css">

        <!-- Polyfills -->
        <script src="/js/polyfill.min.js"></script>

        <!-- Analytics (GA) -->
        <script>
            /* eslint-disable */
            (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
            (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
            m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
            })(window,document,'script','//www.google-analytics.com/analytics.js','ga');

            ga('create', 'UA-30688952-1', {
                'sampleRate': 10
            });
            ga('send', 'pageview');
            window.GA_ID = 'UA-30688952-1';
            /* eslint-enable */
        </script>
    <style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
/*
    Frameless           <http://framelessgrid.com/>
    by Joni Korpi       <http://jonikorpi.com/>
    licensed under CC0  <http://creativecommons.org/publicdomain/zero/1.0/>
*/
/* Media Queries */
/* Width */
/*
* ... small | medium     | intermediate | big ...
* ... medium-and-smaller |
*          ... intermediate-and-smaller |
*/
/* Height */
@media only screen and (max-width: 479px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 100%; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 480px; } }

@media only screen and (min-width: 768px) and (max-width: 941px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 768px; } }

@media only screen and (min-width: 942px) {
  .inner {
    margin: 0 auto;
    width: 942px; } }

/* Tags */
html,
body {
  display: block;
  margin: 0;
  background-color: #4280d7;
  padding: 0;
  color: #575e75;
  font-family: "Helvetica Neue", "Helvetica", Arial, sans-serif; }

/* Typography */
h1,
h2,
h3,
h4 {
  margin: 0;
  border: 0;
  padding: 0;
  color: #575e75;
  font-weight: bold; }

h1 {
  font-size: 2.5rem;
  font-weight: bold; }

h2 {
  font-size: 2rem;
  font-weight: bold; }

h3 {
  font-size: 1.4rem;
  font-weight: bold; }

h4 {
  font-size: 1rem;
  font-weight: bold; }

h5 {
  text-transform: uppercase;
  letter-spacing: 2px;
  font-size: .85rem;
  font-weight: bold; }

p.legal {
  font-size: .8rem; }

p.intro {
  font-size: 1.1rem; }

p.callout {
  margin: 1.5em 0;
  border: 1px solid rgba(0, 0, 0, 0.1);
  border-radius: .5rem;
  background-color: rgba(77, 151, 255, 0.1);
  padding: 1.25em; }
  p.callout.orange {
    background-color: rgba(244, 157, 37, 0.1); }

p a {
  white-space: nowrap; }

b,
strong {
  font-weight: bold; }

/* Links */
a {
  cursor: pointer;
  color: #4d97ff;
  font-weight: bold; }
  a:link, a:visited, a:active {
    text-decoration: none;
    color: #4d97ff; }
  a:hover {
    text-decoration: none;
    color: #4280d7; }

/* Classes */
.empty {
  border: 1px solid rgba(0, 0, 0, 0.1);
  border-radius: 5px;
  background-color: rgba(77, 151, 255, 0.1);
  padding: 10px;
  text-align: center;
  line-height: 2rem;
  color: #575e75; }
  .empty h4 {
    color: #575e75; }

h1,
h2,
h3,
h4,
h5,
p {
  line-height: 1.7em;
  color: #575e75; }

p {
  font-size: 1rem;
  font-weight: normal; }

::selection {
  background-color: rgba(77, 151, 255, 0.25); }

ol,
ul {
  padding-left: 20px;
  line-height: 1.5em;
  font-size: 1rem;
  font-weight: normal; }
  ol li,
  ul li {
    margin: .75em 0; }

dl {
  line-height: 1.5rem;
  font-size: 1rem;
  font-weight: normal; }
  dl dt {
    font-weight: bold; }
  dl dd {
    margin: 0; }

#view {
  display: inline-block;
  /* NOTE: Margin should match height in navigation.scss */
  margin-top: 50px;
  background-color: #fcfcfc;
  padding: 20px 0;
  min-width: 100%;
  min-height: 680px; }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
.button {
  display: inline-block;
  margin: .5em 0;
  border: 0;
  border-radius: .5rem;
  background-color: #4d97ff;
  cursor: pointer;
  padding: 1em 1.25em;
  color: white;
  font-size: .8rem;
  font-weight: bold;
  /* USER BUTTON STATES */
  /* DATA BUTTON STATES */ }
  .button:focus {
    outline: none; }
  .button.white {
    background-color: white;
    color: #4d97ff; }
  .button.pass {
    background-color: #0fbd8c; }
  .button.fail {
    background-color: #ffab1a; }
  .button:disabled {
    box-shadow: none; }
  .button.large {
    border-radius: .25rem;
    font-size: 1rem;
    font-family: "Helvetica Neue", Helvetica, Arial, sans-serif;
    padding: .75rem 1.25rem .8125rem; }
  .button.icon-right img {
    height: 1.25rem;
    margin-bottom: -.25rem;
    margin-left: .5rem;
    margin-right: -.25rem; }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
/*
    Frameless           <http://framelessgrid.com/>
    by Joni Korpi       <http://jonikorpi.com/>
    licensed under CC0  <http://creativecommons.org/publicdomain/zero/1.0/>
*/
/* Media Queries */
/* Width */
/*
* ... small | medium     | intermediate | big ...
* ... medium-and-smaller |
*          ... intermediate-and-smaller |
*/
/* Height */
@media only screen and (max-width: 479px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 100%; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 480px; } }

@media only screen and (min-width: 768px) and (max-width: 941px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 768px; } }

@media only screen and (min-width: 942px) {
  .inner {
    margin: 0 auto;
    width: 942px; } }

.row label {
  font-weight: 500; }

.input {
  transition: all .5s ease;
  margin-bottom: .75rem;
  border: 1px solid rgba(0, 0, 0, 0.1);
  border-radius: 5px;
  background-color: #fafafa;
  padding: 0 1rem;
  height: 3rem;
  color: #575e75;
  font-size: .875rem;
  /* IE10/11-specific style resets */ }
  .input:focus {
    transition: all .5s ease;
    outline: none;
    border: 1px solid #4d97ff; }
  .input.fail {
    border: 1px solid #ffab1a; }
  .input.pass {
    border: 1px solid #0fbd8c; }
  .input::-ms-reveal, .input::-ms-clear {
    display: none; }
</style><style type="text/css">/*
 * Styles for the Row component used by formsy-react-components
 * Should be imported for each component that extends one of
 * the formsy-react-components
 */
.row .required-symbol {
  display: none; }

.row label {
  display: inline-block;
  margin-bottom: .75rem; }

.row.no-label label {
  display: none; }

/* allow elements such as validation errors to position relative to this row */
.row-with-tooltip {
  position: relative; }

.row-label {
  margin-bottom: .75rem;
  line-height: 1.7rem; }

.row-inline {
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex; }

/* override margin-bottom so placing a label next to a radio button does not
mess up vertical alignment */
.row-inline label {
  margin-bottom: 0; }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
/*
    Frameless           <http://framelessgrid.com/>
    by Joni Korpi       <http://jonikorpi.com/>
    licensed under CC0  <http://creativecommons.org/publicdomain/zero/1.0/>
*/
/* Media Queries */
/* Width */
/*
* ... small | medium     | intermediate | big ...
* ... medium-and-smaller |
*          ... intermediate-and-smaller |
*/
/* Height */
@media only screen and (max-width: 479px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 100%; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 480px; } }

@media only screen and (min-width: 768px) and (max-width: 941px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 768px; } }

@media only screen and (min-width: 942px) {
  .inner {
    margin: 0 auto;
    width: 942px; } }

.dropdown {
  display: none;
  position: absolute;
  right: 0;
  border: 1px solid rgba(0, 0, 0, 0.1);
  border-radius: 0 0 5px 5px;
  background-color: #4d97ff;
  padding: 10px;
  min-width: 9rem;
  max-width: 16.25rem;
  overflow: visible;
  color: white;
  font-size: .8125rem;
  font-weight: normal; }
  .dropdown.staging {
    background-color: #ffab1a; }
  .dropdown.open {
    display: block; }
  .dropdown a:link, .dropdown a:visited, .dropdown a:active {
    background-color: transparent;
    color: white; }
  .dropdown input {
    margin-bottom: 12px;
    width: calc(100% - 30px); }
  .dropdown label {
    display: block;
    margin-bottom: 5px; }
  .dropdown > li {
    display: block;
    line-height: 30px; }
    .dropdown > li.divider {
      margin-top: 10px;
      border-top: 1px solid rgba(0, 0, 0, 0.1); }
    .dropdown > li a {
      display: block;
      padding: 0 10px; }
      .dropdown > li a:hover {
        background-color: rgba(0, 0, 0, 0.1);
        text-decoration: none; }
  .dropdown.with-arrow {
    margin-top: 14px;
    border-radius: 5px;
    overflow: visible; }
    .dropdown.with-arrow:before {
      display: block;
      position: absolute;
      top: -7px;
      right: 10%;
      -webkit-transform: rotate(45deg);
          -ms-transform: rotate(45deg);
              transform: rotate(45deg);
      border-top: 1px solid rgba(0, 0, 0, 0.1);
      border-left: 1px solid rgba(0, 0, 0, 0.1);
      border-radius: 5px;
      background-color: #4d97ff;
      width: 14px;
      height: 14px;
      content: ""; }
</style><style type="text/css">.studio-status-icon-spinner {
  /* This class can be used on an icon that should spin.
    It first plays the intro animation, then spins forever. */
  -webkit-animation-name: intro, spin;
          animation-name: intro, spin;
  -webkit-animation-duration: .25s, 1s;
          animation-duration: .25s, 1s;
  -webkit-animation-timing-function: cubic-bezier(0.3, -3, 0.6, 3), cubic-bezier(0.4, 0.1, 0.4, 1);
          animation-timing-function: cubic-bezier(0.3, -3, 0.6, 3), cubic-bezier(0.4, 0.1, 0.4, 1);
  -webkit-animation-delay: 0s, .25s;
          animation-delay: 0s, .25s;
  -webkit-animation-iteration-count: 1, infinite;
          animation-iteration-count: 1, infinite;
  -webkit-animation-direction: normal;
          animation-direction: normal;
  width: 1.4rem;
  /* standard is 1.4 rem but can be overwritten by parent */
  height: 1.4rem;
  -webkit-transform-origin: center;
      -ms-transform-origin: center;
          transform-origin: center; }

@-webkit-keyframes intro {
  0% {
    -webkit-transform: scale(0);
            transform: scale(0);
    opacity: 0; }
  100% {
    -webkit-transform: scale(1);
            transform: scale(1);
    opacity: 1; } }

@keyframes intro {
  0% {
    -webkit-transform: scale(0);
            transform: scale(0);
    opacity: 0; }
  100% {
    -webkit-transform: scale(1);
            transform: scale(1);
    opacity: 1; } }

@-webkit-keyframes spin {
  0% {
    -webkit-transform: rotate(0);
            transform: rotate(0); }
  100% {
    -webkit-transform: rotate(359deg);
            transform: rotate(359deg); } }

@keyframes spin {
  0% {
    -webkit-transform: rotate(0);
            transform: rotate(0); }
  100% {
    -webkit-transform: rotate(359deg);
            transform: rotate(359deg); } }
</style><style type="text/css">/*
    Frameless           <http://framelessgrid.com/>
    by Joni Korpi       <http://jonikorpi.com/>
    licensed under CC0  <http://creativecommons.org/publicdomain/zero/1.0/>
*/
/* Media Queries */
/* Width */
/*
* ... small | medium     | intermediate | big ...
* ... medium-and-smaller |
*          ... intermediate-and-smaller |
*/
/* Height */
@media only screen and (max-width: 479px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 100%; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 480px; } }

@media only screen and (min-width: 768px) and (max-width: 941px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 768px; } }

@media only screen and (min-width: 942px) {
  .inner {
    margin: 0 auto;
    width: 942px; } }

.flex-row {
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-flex-direction: row;
      -ms-flex-direction: row;
          flex-direction: row;
  -webkit-flex-wrap: wrap;
      -ms-flex-wrap: wrap;
          flex-wrap: wrap;
  -webkit-justify-content: space-around;
      -ms-flex-pack: distribute;
          justify-content: space-around;
  -webkit-align-items: center;
      -ms-flex-align: center;
          align-items: center; }
  .flex-row.column {
    -webkit-flex-direction: column;
        -ms-flex-direction: column;
            flex-direction: column;
    -webkit-justify-content: center;
        -ms-flex-pack: center;
            justify-content: center; }
  .flex-row.uneven {
    -webkit-align-items: flex-start;
        -ms-flex-align: start;
                -ms-grid-row-align: flex-start;
            align-items: flex-start; }
    .flex-row.uneven .short {
      width: 13.75em; }
    .flex-row.uneven .long {
      width: 38.75em;
      text-align: left; }
  @media only screen and (max-width: 767px) {
    .flex-row {
      -webkit-flex-direction: column;
          -ms-flex-direction: column;
              flex-direction: column; }
      .flex-row.uneven .short,
      .flex-row.uneven .long {
        margin: auto;
        width: 90%; } }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
.login {
  padding: 10px;
  width: 200px;
  line-height: 1.5rem;
  white-space: normal;
  color: white;
  font-size: .8125rem; }
  .login .button {
    padding: .75em; }
  .login .row {
    margin-bottom: 1.25rem; }
  .login .input {
    margin-bottom: 12px;
    width: calc(100% - 30px);
    height: 2.25rem; }
  .login label {
    padding-top: 5px;
    font-weight: bold; }
  .login .spinner {
    margin: 0 .8rem;
    width: 1rem;
    vertical-align: middle; }
  .login .submit-row {
    -webkit-justify-content: space-between;
        -ms-flex-pack: justify;
            justify-content: space-between;
    -webkit-flex-direction: row;
        -ms-flex-direction: row;
            flex-direction: row; }
  .login .submit-button {
    margin-top: 5px; }
  .login a {
    margin: auto 0;
    color: white; }
    .login a:link, .login a:visited, .login a:active {
      color: white; }
    .login a:hover {
      background-color: transparent; }
  .login .error {
    border: 1px solid rgba(0, 0, 0, 0.2);
    border-radius: 5px;
    background-color: #ffab1a;
    padding: .75em 1em; }
</style><style type="text/css"></style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
/*
    Frameless           <http://framelessgrid.com/>
    by Joni Korpi       <http://jonikorpi.com/>
    licensed under CC0  <http://creativecommons.org/publicdomain/zero/1.0/>
*/
/* Media Queries */
/* Width */
/*
* ... small | medium     | intermediate | big ...
* ... medium-and-smaller |
*          ... intermediate-and-smaller |
*/
/* Height */
@media only screen and (max-width: 479px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 100%; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 480px; } }

@media only screen and (min-width: 768px) and (max-width: 941px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 768px; } }

@media only screen and (min-width: 942px) {
  .inner {
    margin: 0 auto;
    width: 942px; } }

.overflow-hidden {
  /* to avoid double scroll bars this
    gets added to body while modal is open */
  overflow: hidden; }

.modal-content {
  position: relative;
  margin: 3.75rem auto;
  border-radius: 1rem;
  box-shadow: 0 0 0 4px rgba(255, 255, 255, 0.15);
  background-color: white;
  padding: 0;
  width: 48.75rem; }
  .modal-content:focus {
    outline: none; }
  @media only screen and (max-width: 941px) {
    .modal-content {
      margin-top: 0;
      width: 100%;
      overflow: auto; } }
  @media only screen and (max-width: 479px), only screen and (max-height: 479px) {
    .modal-content {
      border-radius: 0;
      box-shadow: none;
      height: 100%; } }

.modal-overlay {
  position: fixed;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  z-index: 510;
  background-color: rgba(77, 151, 255, 0.7); }

.modal-content-close {
  position: absolute;
  top: 0.5rem;
  right: 0.5rem;
  border-radius: 1rem;
  background-color: rgba(0, 0, 0, 0.2);
  cursor: pointer;
  width: 2rem;
  height: 2rem;
  text-align: center;
  line-height: 2rem; }

.modal-content-close-img {
  padding-top: 0.5rem; }

/* Close button, Submit button, etc. */
.action-buttons {
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  margin: 1.125rem .8275rem .9375rem .8275rem;
  line-height: 1.5rem;
  -webkit-justify-content: flex-end !important;
      -ms-flex-pack: end !important;
          justify-content: flex-end !important;
  -webkit-align-items: flex-start;
      -ms-flex-align: start;
          align-items: flex-start;
  -webkit-flex-wrap: nowrap;
      -ms-flex-wrap: nowrap;
          flex-wrap: nowrap; }
  @media only screen and (max-width: 941px) {
    .action-buttons {
      -webkit-justify-content: center !important;
          -ms-flex-pack: center !important;
              justify-content: center !important;
      -webkit-flex-direction: row !important;
          -ms-flex-direction: row !important;
              flex-direction: row !important; } }

/* setting overall modal to contain overflow looks good, but isn't
compatible with elements (like validation popups) that need to bleed
past modal boundary. This class can be used to force modal button
row to appear to contain overflow. */
.action-buttons-overflow-fix {
  margin-bottom: .9375rem; }

/* For action button row where left/right margin is handled by parent element */
.action-buttons.action-buttons-no-inset {
  margin-left: 0;
  margin-right: 0; }

.action-button {
  margin: 0 0 0 .54625rem;
  border-radius: .25rem;
  padding: 6px 1.25rem 14px 1.25rem;
  height: 36px; }

.action-button.close-button {
  border: 1px solid rgba(0, 0, 0, 0.1); }

.action-button-text {
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex; }

.action-button.disabled {
  background-color: rgba(0, 0, 0, 0.2); }

.error-text {
  display: block;
  border: 1px solid rgba(0, 0, 0, 0.1);
  border-radius: 5px;
  background-color: #ffab1a;
  padding: 1rem;
  min-height: 1rem;
  overflow: visible;
  color: white; }

.modal-sizes * {
  box-sizing: border-box; }

.modal-sizes {
  margin: 100px auto;
  outline: none;
  padding: 0;
  max-width: 36.25rem;
  /* 580px; */
  -webkit-user-select: none;
     -moz-user-select: none;
      -ms-user-select: none;
          user-select: none; }
  @media only screen and (min-width: 480px) and (max-width: 767px), only screen and (min-height: 480px) and (max-height: 767px) {
    .modal-sizes {
      margin: 40px auto; } }
  @media only screen and (max-width: 479px), only screen and (max-height: 479px) {
    .modal-sizes {
      margin: 0 auto;
      width: auto; } }
  .modal-sizes .modal-header {
    padding-top: .75rem;
    width: 100%;
    height: 3rem; }
    @media only screen and (max-width: 479px), only screen and (max-height: 479px) {
      .modal-sizes .modal-header {
        border-radius: 0; } }
  .modal-sizes .modal-content {
    font-size: .875rem; }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
#navigation {
  display: block;
  position: fixed;
  top: 0;
  left: 0;
  z-index: 10;
  border-bottom: 1px solid rgba(0, 0, 0, 0.1);
  box-shadow: 0 0 3px rgba(0, 0, 0, 0.25);
  background-color: #4d97ff;
  width: 100%;
  /* NOTE: Height should match offset settings in main.scss file */
  height: 50px; }
  #navigation.staging {
    background-color: #ffab1a; }
  .ie9 #navigation {
    display: table;
    table-layout: fixed; }
  #navigation .inner > ul {
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    margin: 0;
    padding: 0;
    height: 50px;
    list-style: none;
    -webkit-flex-wrap: nowrap;
        -ms-flex-wrap: nowrap;
            flex-wrap: nowrap;
    -webkit-flex-direction: row;
        -ms-flex-direction: row;
            flex-direction: row;
    -webkit-justify-content: flex-start;
        -ms-flex-pack: start;
            justify-content: flex-start; }
    .ie9 #navigation .inner > ul {
      display: table-row; }
    #navigation .inner > ul > li {
      display: inline-block;
      position: relative;
      float: left;
      margin: 0;
      height: 100%;
      -webkit-align-self: flex-start;
          -ms-flex-item-align: start;
              align-self: flex-start; }
      #navigation .inner > ul > li.right {
        float: right;
        margin-left: auto;
        -webkit-align-self: flex-end;
            -ms-flex-item-align: end;
                align-self: flex-end; }
        .ie9 #navigation .inner > ul > li.right {
          float: none; }
        #navigation .inner > ul > li.right a:hover {
          background-color: rgba(0, 0, 0, 0.1); }
      .ie9 #navigation .inner > ul > li {
        display: table-cell;
        float: none;
        height: 50px;
        vertical-align: bottom; }
  #navigation .link > a {
    display: block;
    padding: 13px 15px 4px 15px;
    height: 33px;
    text-decoration: none;
    white-space: nowrap;
    color: white;
    font-size: .85rem;
    font-weight: bold; }
    #navigation .link > a:hover {
      background-color: rgba(0, 0, 0, 0.1); }
</style><style type="text/css">/*
    Frameless           <http://framelessgrid.com/>
    by Joni Korpi       <http://jonikorpi.com/>
    licensed under CC0  <http://creativecommons.org/publicdomain/zero/1.0/>
*/
/* Media Queries */
/* Width */
/*
* ... small | medium     | intermediate | big ...
* ... medium-and-smaller |
*          ... intermediate-and-smaller |
*/
/* Height */
@media only screen and (max-width: 479px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 100%; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 480px; } }

@media only screen and (min-width: 768px) and (max-width: 941px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 768px; } }

@media only screen and (min-width: 942px) {
  .inner {
    margin: 0 auto;
    width: 942px; } }

.modal-content-iframe {
  border: 0; }
</style><style type="text/css">/*
    Frameless           <http://framelessgrid.com/>
    by Joni Korpi       <http://jonikorpi.com/>
    licensed under CC0  <http://creativecommons.org/publicdomain/zero/1.0/>
*/
/* Media Queries */
/* Width */
/*
* ... small | medium     | intermediate | big ...
* ... medium-and-smaller |
*          ... intermediate-and-smaller |
*/
/* Height */
@media only screen and (max-width: 479px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 100%; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 480px; } }

@media only screen and (min-width: 768px) and (max-width: 941px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 768px; } }

@media only screen and (min-width: 942px) {
  .inner {
    margin: 0 auto;
    width: 942px; } }

.modal-content.mod-registration {
  width: 38.125rem;
  overflow: hidden; }

.modal-content-iframe.mod-registration {
  width: 38.125rem;
  min-height: 27.375rem; }

.modal-content.recaptcha-open {
  min-height: 500px; }

.modal-content-iframe.recaptcha-open {
  min-height: 500px; }

@media only screen and (max-width: 941px) {
  .modal-content.mod-registration {
    width: 100%;
    overflow: scroll; }
  .modal-content-iframe.mod-registration {
    height: 27.375rem; } }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
/*
    Frameless           <http://framelessgrid.com/>
    by Joni Korpi       <http://jonikorpi.com/>
    licensed under CC0  <http://creativecommons.org/publicdomain/zero/1.0/>
*/
/* Media Queries */
/* Width */
/*
* ... small | medium     | intermediate | big ...
* ... medium-and-smaller |
*          ... intermediate-and-smaller |
*/
/* Height */
@media only screen and (max-width: 479px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 100%; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 480px; } }

@media only screen and (min-width: 768px) and (max-width: 941px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 768px; } }

@media only screen and (min-width: 942px) {
  .inner {
    margin: 0 auto;
    width: 942px; } }

.account-nav .user-info {
  display: inline-block;
  padding: 14px 15px 4px 15px;
  max-width: 260px;
  height: 33px;
  overflow: hidden;
  text-decoration: none;
  text-overflow: ellipsis;
  white-space: nowrap;
  color: white;
  font-size: .8125rem;
  font-weight: normal; }
  .account-nav .user-info .avatar {
    margin-right: 10px;
    border-radius: 3px;
    width: 24px;
    height: 24px;
    vertical-align: middle; }
  .account-nav .user-info:hover {
    background-color: rgba(0, 0, 0, 0.1); }
  .account-nav .user-info.open {
    background-color: rgba(0, 0, 0, 0.1); }
  .account-nav .user-info:after {
    display: inline-block;
    margin-left: 8px;
    background-image: url("/images/dropdown.png");
    background-repeat: no-repeat;
    background-position: center center;
    background-size: 50%;
    width: 20px;
    height: 20px;
    vertical-align: middle;
    content: " "; }

.account-nav .dropdown {
  top: 50px;
  padding: 0;
  padding-top: 5px;
  width: 100%;
  box-sizing: border-box; }

@media only screen and (max-width: 479px) {
  .account-nav {
    margin-left: 0; }
    .account-nav .user-info .avatar {
      margin-right: 0; }
    .account-nav .user-info:after {
      display: none; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  .account-nav {
    margin-left: 0; }
    .account-nav .user-info .avatar {
      margin-right: 0; }
    .account-nav .user-info:after {
      display: none; } }

@media only screen and (min-width: 768px) and (max-width: 941px) {
  .account-nav {
    margin-left: 0; } }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
/*
    Frameless           <http://framelessgrid.com/>
    by Joni Korpi       <http://jonikorpi.com/>
    licensed under CC0  <http://creativecommons.org/publicdomain/zero/1.0/>
*/
/* Media Queries */
/* Width */
/*
* ... small | medium     | intermediate | big ...
* ... medium-and-smaller |
*          ... intermediate-and-smaller |
*/
/* Height */
@media only screen and (max-width: 479px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 100%; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 480px; } }

@media only screen and (min-width: 768px) and (max-width: 941px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 768px; } }

@media only screen and (min-width: 942px) {
  .inner {
    margin: 0 auto;
    width: 942px; } }

#navigation.staging .messages .message-count {
  display: none; }
  #navigation.staging .messages .message-count.show {
    background-color: #4d97ff; }

#navigation .logo {
  margin-right: 10px; }
  #navigation .logo a {
    display: block;
    transition: .15s ease all;
    margin: 0 6px 0 0;
    border: 0;
    background-image: url("/images/logo_sm.png");
    background-repeat: no-repeat;
    background-position: center center;
    background-size: 95%;
    width: 81px;
    height: 50px; }
    #navigation .logo a:hover {
      transition: .15s ease all;
      background-size: 100%; }

#navigation .inner > ul > li.search {
  margin: 0 20px;
  border-right: 0;
  color: white;
  -webkit-flex-grow: 3;
      -ms-flex-positive: 3;
          flex-grow: 3; }
  .ie9 #navigation .inner > ul > li.search {
    width: 100%; }
  #navigation .inner > ul > li.search .form {
    margin: 0; }
  #navigation .inner > ul > li.search .row .help-block {
    display: none; }
  #navigation .inner > ul > li.search .input,
  #navigation .inner > ul > li.search .button {
    display: inline-block;
    margin-top: 5px;
    outline: none;
    border: 0;
    background-color: rgba(0, 0, 0, 0.1);
    height: 14px; }
    #navigation .inner > ul > li.search .input[type=text],
    #navigation .inner > ul > li.search .button[type=text] {
      transition: .15s ease background-color;
      padding: 0;
      padding-right: 10px;
      padding-left: 40px;
      width: calc(100% - 50px);
      height: 40px;
      color: white;
      font-size: .85em; }
      #navigation .inner > ul > li.search .input[type=text]::-webkit-input-placeholder,
      #navigation .inner > ul > li.search .button[type=text]::-webkit-input-placeholder {
        color: rgba(255, 255, 255, 0.75); }
      #navigation .inner > ul > li.search .input[type=text]:-ms-input-placeholder,
      #navigation .inner > ul > li.search .button[type=text]:-ms-input-placeholder {
        color: rgba(255, 255, 255, 0.75); }
      #navigation .inner > ul > li.search .input[type=text]::placeholder,
      #navigation .inner > ul > li.search .button[type=text]::placeholder {
        color: rgba(255, 255, 255, 0.75); }
      #navigation .inner > ul > li.search .input[type=text]:focus,
      #navigation .inner > ul > li.search .button[type=text]:focus {
        transition: .15s ease background-color;
        background-color: rgba(0, 0, 0, 0.2); }
      .ie9 #navigation .inner > ul > li.search .input[type=text], .ie9
      #navigation .inner > ul > li.search .button[type=text] {
        width: 70px; }
  #navigation .inner > ul > li.search .btn-search {
    position: absolute;
    box-shadow: none;
    background-color: transparent;
    background-image: url("/images/nav-search-glass.png");
    background-repeat: no-repeat;
    background-position: center center;
    background-size: 14px 14px;
    width: 40px;
    height: 40px; }
    #navigation .inner > ul > li.search .btn-search:hover {
      box-shadow: none; }

#navigation .messages > a,
#navigation .mystuff > a {
  background-repeat: no-repeat;
  background-position: center center;
  background-size: 45%;
  padding-right: 10px;
  padding-left: 10px;
  width: 30px;
  overflow: hidden;
  text-indent: 50px;
  white-space: nowrap; }
  #navigation .messages > a:hover,
  #navigation .mystuff > a:hover {
    background-size: 50%; }

#navigation .messages > a {
  background-image: url("/images/nav-notifications.png"); }

#navigation .messages .message-count {
  display: none; }
  #navigation .messages .message-count.show {
    display: block;
    position: absolute;
    top: .5rem;
    right: .25rem;
    border-radius: 1rem;
    background-color: #ffab1a;
    padding: 0 .25rem;
    text-indent: 0;
    line-height: 1rem;
    color: white;
    font-size: .7rem;
    font-weight: bold; }

#navigation .mystuff > a {
  background-image: url("/images/mystuff.png"); }

@media only screen and (max-width: 479px) {
  #navigation .inner {
    width: 18.75em; }
    #navigation .inner > ul > li.login-item {
      margin-left: 0; }
    #navigation .inner .create,
    #navigation .inner .discuss,
    #navigation .inner .explore,
    #navigation .inner .search,
    #navigation .inner .help,
    #navigation .inner .mystuff,
    #navigation .inner .profile-name {
      display: none; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  #navigation .inner {
    width: 28.75em; }
    #navigation .inner > ul > li.login-item {
      margin-left: 0; }
    #navigation .inner .discuss,
    #navigation .inner .explore,
    #navigation .inner .search,
    #navigation .inner .mystuff,
    #navigation .inner .profile-name {
      display: none; } }

@media only screen and (min-width: 768px) and (max-width: 941px) {
  #navigation .inner {
    width: 38.75em; }
    #navigation .inner > ul > li.login-item {
      margin-left: 0; }
    #navigation .inner .explore,
    #navigation .inner .search,
    #navigation .inner .mystuff {
      display: none; } }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
#footer {
  display: block;
  background-color: #f2f2f2;
  padding: 10px 0;
  color: #575e75;
  font-size: .85rem; }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
/*
    Frameless           <http://framelessgrid.com/>
    by Joni Korpi       <http://jonikorpi.com/>
    licensed under CC0  <http://creativecommons.org/publicdomain/zero/1.0/>
*/
/* Media Queries */
/* Width */
/*
* ... small | medium     | intermediate | big ...
* ... medium-and-smaller |
*          ... intermediate-and-smaller |
*/
/* Height */
@media only screen and (max-width: 479px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 100%; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 480px; } }

@media only screen and (min-width: 768px) and (max-width: 941px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 768px; } }

@media only screen and (min-width: 942px) {
  .inner {
    margin: 0 auto;
    width: 942px; } }

.select label {
  font-weight: 500; }

.select select {
  transition: border .5s ease;
  margin-bottom: .75rem;
  border: 1px solid rgba(0, 0, 0, 0.1);
  border-radius: 5px;
  background: #fafafa url(data:image/svg+xml;base64,PHN2ZyBkYXRhLW5hbWU9IkxheWVyIDEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjQ4IiBoZWlnaHQ9IjY0Ij48cGF0aCBkPSJNMjQgMzcuNDNhMS44OCAxLjg4IDAgMCAxLTEuMzMtLjU1bC01LjExLTUuMTFhMS44NyAxLjg3IDAgMCAxIDAtMi42NGMuNzMtLjczIDEyLjE0LS43MyAxMi44NyAwYTEuODcgMS44NyAwIDAgMSAwIDIuNjRsLTUuMTEgNS4xMWExLjg2IDEuODYgMCAwIDEtMS4zMi41NXoiIGZpbGw9IiNiM2IzYjMiLz48cGF0aCBzdHlsZT0iaXNvbGF0aW9uOmlzb2xhdGUiIGZpbGw9IiMyMzFmMjAiIG9wYWNpdHk9Ii4xIiBkPSJNLjAxIDBoMXY2NGgtMXoiLz48L3N2Zz4=) no-repeat right center;
  padding-right: 4rem;
  padding-left: 1rem;
  width: 100%;
  height: 3rem;
  color: #575e75;
  font-size: .875rem;
  -webkit-appearance: none;
     -moz-appearance: none;
          appearance: none; }
  .select select::-ms-expand {
    display: none; }
  .select select::-ms-value {
    background-color: inherit;
    padding-left: 1rem;
    color: inherit; }
  .select select:focus {
    outline: none;
    border: 1px solid #4d97ff; }
  .select select:-moz-focusring {
    text-shadow: 0 0 0 #575e75;
    color: transparent; }
  .select select:focus, .select select:hover {
    background: #fafafa url(data:image/svg+xml;base64,PHN2ZyBkYXRhLW5hbWU9IkxheWVyIDEiIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyIgd2lkdGg9IjQ4IiBoZWlnaHQ9IjY0Ij48cGF0aCBzdHlsZT0iaXNvbGF0aW9uOmlzb2xhdGUiIGZpbGw9IiMyMzFmMjAiIG9wYWNpdHk9Ii4xIiBkPSJNLjAxIDBoNDh2NjRoLTQ4eiIvPjxwYXRoIGQ9Ik0yNCAzNy41OGExLjg4IDEuODggMCAwIDEtMS4zMy0uNThsLTUuMTEtNS4xMWExLjg5IDEuODkgMCAwIDEgMC0yLjY1Yy43My0uNzMgMTIuMTQtLjczIDEyLjg3IDBhMS44NyAxLjg3IDAgMCAxIDAgMi42NEwyNS4zMiAzN2ExLjg2IDEuODYgMCAwIDEtMS4zMi41OHoiIGZpbGw9IiNiM2IzYjMiLz48L3N2Zz4=) no-repeat right center; }
  .select select > option {
    background-color: white;
    width: 100%; }
</style><style type="text/css">/*
    Frameless           <http://framelessgrid.com/>
    by Joni Korpi       <http://jonikorpi.com/>
    licensed under CC0  <http://creativecommons.org/publicdomain/zero/1.0/>
*/
/* Media Queries */
/* Width */
/*
* ... small | medium     | intermediate | big ...
* ... medium-and-smaller |
*          ... intermediate-and-smaller |
*/
/* Height */
@media only screen and (max-width: 479px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 100%; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 480px; } }

@media only screen and (min-width: 768px) and (max-width: 941px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 768px; } }

@media only screen and (min-width: 942px) {
  .inner {
    margin: 0 auto;
    width: 942px; } }

.language-chooser .select select {
  width: 13.75rem;
  /* 3 columns */ }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
/*
    Frameless           <http://framelessgrid.com/>
    by Joni Korpi       <http://jonikorpi.com/>
    licensed under CC0  <http://creativecommons.org/publicdomain/zero/1.0/>
*/
/* Media Queries */
/* Width */
/*
* ... small | medium     | intermediate | big ...
* ... medium-and-smaller |
*          ... intermediate-and-smaller |
*/
/* Height */
@media only screen and (max-width: 479px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 100%; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 480px; } }

@media only screen and (min-width: 768px) and (max-width: 941px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 768px; } }

@media only screen and (min-width: 942px) {
  .inner {
    margin: 0 auto;
    width: 942px; } }

#footer .lists {
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  text-align: center;
  -webkit-flex-direction: row;
      -ms-flex-direction: row;
          flex-direction: row;
  -webkit-flex-wrap: nowrap;
      -ms-flex-wrap: nowrap;
          flex-wrap: nowrap;
  -webkit-justify-content: space-between;
      -ms-flex-pack: justify;
          justify-content: space-between; }
  #footer .lists dl {
    display: inline-block;
    vertical-align: top;
    text-align: left;
    font-size: .8rem; }
  #footer .lists dt {
    display: block;
    margin-bottom: 8px; }
  #footer .lists dd {
    display: block;
    margin: 5px 0;
    line-height: 1.2rem; }
    #footer .lists dd a {
      font-weight: 400; }

#footer .copyright {
  display: block;
  width: 100%;
  text-align: center; }
  #footer .copyright p {
    font-size: .7rem; }

#footer .language-chooser {
  text-align: center; }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
/*
    Frameless           <http://framelessgrid.com/>
    by Joni Korpi       <http://jonikorpi.com/>
    licensed under CC0  <http://creativecommons.org/publicdomain/zero/1.0/>
*/
/* Media Queries */
/* Width */
/*
* ... small | medium     | intermediate | big ...
* ... medium-and-smaller |
*          ... intermediate-and-smaller |
*/
/* Height */
@media only screen and (max-width: 479px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 100%; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 480px; } }

@media only screen and (min-width: 768px) and (max-width: 941px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 768px; } }

@media only screen and (min-width: 942px) {
  .inner {
    margin: 0 auto;
    width: 942px; } }

#donor {
  color: #575e75;
  font-size: .875rem;
  line-height: 1.5em;
  background-color: #f2f2f2;
  padding-bottom: 2.5rem;
  padding-top: 1rem; }
  #donor #donor-text {
    text-align: center;
    width: 58.75em;
    margin: 0 auto; }

@media only screen and (min-width: 768px) and (max-width: 942px) {
  #donor #donor-text {
    width: 53.75em; } }

@media only screen and (min-width: 480px) and (max-width: 768px) {
  #donor #donor-text {
    width: 28.75em; } }

@media only screen and (max-width: 480px) {
  #donor #donor-text {
    width: 18.75em; } }
</style><style type="text/css">.crash-container {
  /* UI Primary Colors */
  /* #FF661A */
  /* UI Secondary Colors */
  /* 3.0 colors */
  /* Using www naming convention for now, should be consistent with gui */
  /* #CF63CF Sounds Primary */
  /* modals */
  /* Overlay UI Gray Colors */
  /* Typography Colors */
  /* Down Deep */
  /*
    Frameless           <http://framelessgrid.com/>
    by Joni Korpi       <http://jonikorpi.com/>
    licensed under CC0  <http://creativecommons.org/publicdomain/zero/1.0/>
*/
  /* Media Queries */
  /* Width */
  /*
* ... small | medium     | intermediate | big ...
* ... medium-and-smaller |
*          ... intermediate-and-smaller |
*/
  /* Height */
  margin: 3rem auto;
  border: 1px solid #d9d9d9;
  border-radius: 10px;
  background-color: #fcfcfc;
  width: 60%;
  overflow: hidden;
  text-align: center; }
  @media only screen and (max-width: 479px) {
    .crash-container #view {
      text-align: center; }
    .crash-container .inner {
      margin: 0 auto;
      width: 100%; } }
  @media only screen and (min-width: 480px) and (max-width: 767px) {
    .crash-container #view {
      text-align: center; }
    .crash-container .inner {
      margin: 0 auto;
      width: 480px; } }
  @media only screen and (min-width: 768px) and (max-width: 941px) {
    .crash-container #view {
      text-align: center; }
    .crash-container .inner {
      margin: 0 auto;
      width: 768px; } }
  @media only screen and (min-width: 942px) {
    .crash-container .inner {
      margin: 0 auto;
      width: 942px; } }
  .crash-container img {
    width: 100%; }
  .crash-container .crash-message {
    margin: 2rem; }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
/*
    Frameless           <http://framelessgrid.com/>
    by Joni Korpi       <http://jonikorpi.com/>
    licensed under CC0  <http://creativecommons.org/publicdomain/zero/1.0/>
*/
/* Media Queries */
/* Width */
/*
* ... small | medium     | intermediate | big ...
* ... medium-and-smaller |
*          ... intermediate-and-smaller |
*/
/* Height */
@media only screen and (max-width: 479px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 100%; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 480px; } }

@media only screen and (min-width: 768px) and (max-width: 941px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 768px; } }

@media only screen and (min-width: 942px) {
  .inner {
    margin: 0 auto;
    width: 942px; } }

.title-banner {
  transition: background-image .5s ease, background-color .5s ease;
  margin-bottom: 40px;
  background-color: #0fbd8c;
  background-position: center;
  background-size: cover;
  padding: 20px 0;
  width: 100%; }

.title-banner-h1,
.title-banner-p {
  margin: 0 auto;
  padding: 5px 0;
  text-align: center;
  color: white; }

.title-banner-p {
  max-width: 500px; }

.title-banner-strong {
  font-weight: 700; }

.title-banner.mod-blue-bg {
  background-color: #4d97ff; }
  .title-banner.mod-blue-bg a {
    color: white; }
  .title-banner.mod-blue-bg a.mod-underline {
    text-decoration: underline; }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
.warning-banner {
  background-color: #ff661a;
  margin-bottom: 0; }
  .warning-banner .warning-banner-container {
    -webkit-justify-content: center;
        -ms-flex-pack: center;
            justify-content: center; }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
.admin-panel {
  position: fixed;
  top: 0;
  left: 0;
  z-index: 99;
  border: 1px solid #f2f2f2;
  box-shadow: 0 2px 5px rgba(0, 0, 0, 0.25);
  background-color: #f2f2f2;
  padding: 1rem;
  width: 230px;
  height: 100%;
  overflow: scroll;
  text-shadow: none; }
  .admin-panel.hidden {
    width: 10px; }
  .admin-panel .toggle {
    float: right;
    cursor: pointer; }
  .admin-panel .button-row {
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    font-size: small;
    -webkit-align-items: center;
        -ms-flex-align: center;
            align-items: center;
    -webkit-justify-content: space-between;
        -ms-flex-pack: justify;
            justify-content: space-between; }
    .admin-panel .button-row .button {
      padding: .5rem 1rem; }
      .admin-panel .button-row .button.inprogress {
        background-color: #b3b3b3;
        color: #575e75; }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
/*
    Frameless           <http://framelessgrid.com/>
    by Joni Korpi       <http://jonikorpi.com/>
    licensed under CC0  <http://creativecommons.org/publicdomain/zero/1.0/>
*/
/* Media Queries */
/* Width */
/*
* ... small | medium     | intermediate | big ...
* ... medium-and-smaller |
*          ... intermediate-and-smaller |
*/
/* Height */
@media only screen and (max-width: 479px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 100%; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 480px; } }

@media only screen and (min-width: 768px) and (max-width: 941px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 768px; } }

@media only screen and (min-width: 942px) {
  .inner {
    margin: 0 auto;
    width: 942px; } }

.box {
  display: inline-block;
  border: 1px solid #d9d9d9;
  border-radius: 10px 10px 0 0;
  background-color: white;
  width: 100%; }
  @media only screen and (max-width: 479px) {
    .box {
      width: 18.75em; }
      .box .box-header h4,
      .box .box-header h5 {
        line-height: .9rem;
        font-size: .9rem; } }
  @media only screen and (min-width: 480px) and (max-width: 767px) {
    .box {
      width: 28.75em; }
      .box .box-header h4,
      .box .box-header h5 {
        line-height: 1rem;
        font-size: 1rem; } }
  @media only screen and (min-width: 768px) and (max-width: 941px) {
    .box {
      width: 38.75em; }
      .box .box-header h4,
      .box .box-header h5 {
        line-height: 1.1rem;
        font-size: 1.1rem; } }
  @media only screen and (min-width: 942px) {
    .box {
      width: 58.75em; }
      .box .box-header h4,
      .box .box-header h5 {
        line-height: 1.1rem;
        font-size: 1.1rem; } }
  .box .box-header {
    display: block;
    clear: both;
    margin: 0;
    border-top: 1px solid white;
    border-bottom: 1px solid #d9d9d9;
    border-radius: 10px 10px 0 0;
    background-color: #f2f2f2;
    padding: 8px 20px;
    height: 20px;
    overflow: hidden; }
    .box .box-header h4,
    .box .box-header h5 {
      display: inline-block;
      float: left; }
    .box .box-header h5 {
      margin: 0;
      padding-left: 5px;
      text-transform: none;
      letter-spacing: normal;
      font-weight: normal; }
    .box .box-header p {
      display: inline-block;
      float: right;
      margin: 1px 0 0 0;
      padding: 0;
      font-size: .85rem; }
  .box .box-content {
    display: block;
    clear: both;
    background-color: white;
    padding: 8px 20px; }
  .box .empty {
    margin-top: 20px; }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
.thumbnail .thumbnail-image {
  display: block; }
  .thumbnail .thumbnail-image img {
    margin-bottom: 2px;
    border: 1px solid #d9d9d9; }

.thumbnail .thumbnail-title,
.thumbnail .thumbnail-creator, .thumbnail .thumbnail-loves, .thumbnail .thumbnail-favorites, .thumbnail .thumbnail-remixes, .thumbnail .thumbnail-views {
  line-height: 1.2em;
  white-space: nowrap;
  word-wrap: break-word; }

.thumbnail .thumbnail-title {
  margin-bottom: 1px;
  font-size: .923em;
  font-weight: 800; }
  .thumbnail .thumbnail-title a {
    display: block;
    overflow: hidden;
    white-space: nowrap;
    text-overflow: ellipsis; }

.thumbnail .thumbnail-creator, .thumbnail .thumbnail-loves, .thumbnail .thumbnail-favorites, .thumbnail .thumbnail-remixes, .thumbnail .thumbnail-views {
  overflow: hidden;
  white-space: nowrap;
  text-overflow: ellipsis;
  color: #575e75;
  font-size: .8462em; }
  .thumbnail .thumbnail-creator a, .thumbnail .thumbnail-loves a, .thumbnail .thumbnail-favorites a, .thumbnail .thumbnail-remixes a, .thumbnail .thumbnail-views a {
    display: inline; }

.thumbnail .thumbnail-loves,
.thumbnail .thumbnail-favorites,
.thumbnail .thumbnail-remixes,
.thumbnail .thumbnail-views {
  display: inline;
  margin-right: 10px; }
  .thumbnail .thumbnail-loves:before,
  .thumbnail .thumbnail-favorites:before,
  .thumbnail .thumbnail-remixes:before,
  .thumbnail .thumbnail-views:before {
    display: inline-block;
    margin-right: .1rem;
    background-repeat: no-repeat;
    background-position: center center;
    background-size: contain;
    width: .93rem;
    height: .93rem;
    vertical-align: text-top;
    content: ""; }

.thumbnail .thumbnail-loves:before {
  background-image: url("/svgs/love/love_type-gray.svg"); }

.thumbnail .thumbnail-favorites:before {
  background-image: url("/svgs/favorite/favorite_type-gray.svg"); }

.thumbnail .thumbnail-remixes:before {
  background-image: url("/svgs/remix/remix_type-gray.svg"); }

.thumbnail .thumbnail-views:before {
  background-image: url("/svgs/view/view_type-gray.svg"); }

.thumbnail.project {
  width: 144px; }
  .thumbnail.project .thumbnail-image img {
    width: 144px;
    height: 108px; }

.thumbnail.gallery {
  width: 170px; }
  .thumbnail.gallery img {
    width: 170px;
    height: 100px; }
</style><style type="text/css">/* Slider */
.slick-slider {
  position: relative;
  display: block;
  box-sizing: border-box;
  -webkit-touch-callout: none;
  -webkit-user-select: none;
  -moz-user-select: none;
  -ms-user-select: none;
  user-select: none;
  -ms-touch-action: pan-y;
  touch-action: pan-y;
  -webkit-tap-highlight-color: transparent; }

.slick-list {
  position: relative;
  overflow: hidden;
  display: block;
  margin: 0;
  padding: 0; }
  .slick-list:focus {
    outline: none; }
  .slick-list.dragging {
    cursor: pointer;
    cursor: hand; }

.slick-slider .slick-track,
.slick-slider .slick-list {
  -webkit-transform: translate3d(0, 0, 0);
  -ms-transform: translate3d(0, 0, 0);
  transform: translate3d(0, 0, 0); }

.slick-track {
  position: relative;
  left: 0;
  top: 0;
  display: block; }
  .slick-track:before, .slick-track:after {
    content: "";
    display: table; }
  .slick-track:after {
    clear: both; }
  .slick-loading .slick-track {
    visibility: hidden; }

.slick-slide {
  float: left;
  height: 100%;
  min-height: 1px;
  display: none; }
  [dir="rtl"] .slick-slide {
    float: right; }
  .slick-slide img {
    display: block; }
  .slick-slide.slick-loading img {
    display: none; }
  .slick-slide.dragging img {
    pointer-events: none; }
  .slick-initialized .slick-slide {
    display: block; }
  .slick-loading .slick-slide {
    visibility: hidden; }
  .slick-vertical .slick-slide {
    display: block;
    height: auto;
    border: 1px solid transparent; }

.slick-arrow.slick-hidden {
  display: none; }
</style><style type="text/css">@charset "UTF-8";
/* Slider */
.slick-loading .slick-list {
  background: #fff url(data:image/gif;base64,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) center center no-repeat; }

/* Icons */
@font-face {
  font-family: "slick";
  src: url(data:application/vnd.ms-fontobject;base64,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);
  src: url(data:application/vnd.ms-fontobject;base64,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?#iefix) format("embedded-opentype"), url(data:font/woff;base64,d09GRk9UVE8AAAVkAAsAAAAAB1wAAQAAAAAAAAAAAAAAAAAAAAAAAAAAAABDRkYgAAABCAAAAi4AAAKbH/pWDkZGVE0AAAM4AAAAGgAAABxt0civR0RFRgAAA1QAAAAcAAAAIAAyAARPUy8yAAADcAAAAFIAAABgUBj/rmNtYXAAAAPEAAAAUAAAAWIiC0SwaGVhZAAABBQAAAAuAAAANgABMftoaGVhAAAERAAAABwAAAAkA+UCA2htdHgAAARgAAAADgAAAA4ESgBKbWF4cAAABHAAAAAGAAAABgAFUABuYW1lAAAEeAAAANwAAAFuBSeBwnBvc3QAAAVUAAAAEAAAACAAAwABeJw9ks9vEkEUx2cpWyeUoFYgNkHi2Wt7N3rVm3cTs3UVLC4LxIWEQvi1P3i7O1tYLJDAmlgKGEhQrsajf0j7J3jYTXrQWUrMJG+++b55n5e8NwwKBhHDMLv5kxT3ATEBxKBn3qOAl9zxHgb1MAPhHQgHkyF08Gr/L8B/Eb6zWnmCJ7AJVLubQOheArXvJ1A4EXi6j4I+Zg9F0QFKvsnlBCmXeve+sFEnb/nCptdtQ4QYhVFRAT1HrF8UQK/RL/SbmUbclsvGVFXRZKDHUE38cc4qpkbAAsuwiImvro+ufcfaOIQ6szlrmjRJDaKZKnbjN3GWKIbiIzRFUfCffuxxKOL+3LDlDVvx2TdxN84qZEsnhNBa6pgm2dAsnzbLsETdsmRFxUeHV4e+I2/ptN8TyqV8T3Dt29t7EYOuajVIw2y1Wy3M86w0zg/Fz2IvawmQAUHOVrPVfLkoScVynsqsTG0MGUs4z55nh3mnOJa+li+rl9WpPIcFfDubDeaDC+fLBdYN3QADzLauGfj4B6sZmq6CCpqmtSvF0qlUl2qf5AJIUCSlTqlb7lUG+LRfGzZGzZEyBgccMu6MuqPecNDvD4Y9Kjtj4gD+DsvKVMTcMdtqtZtmkzQstQvYje7Syep0PDSAhSOeHYXYWThEF//A/0YvYV1fSQtpKU5STtrhbQ444OtpKSWJIg3pOg8cBs7maTY1EZf07aq+hjWs7IWzdCYTGhb2CtZ47x+Uhx28AAB4nGNgYGBkAIJz765vANHnCyvqYTQAWnkHswAAeJxjYGRgYOADYgkGEGBiYARCFjAG8RgABHYAN3icY2BmYmCcwMDKwMHow5jGwMDgDqW/MkgytDAwMDGwcjKAQQMDAyOQUmCAgoA01xQGB4ZExUmMD/4/YNBjvP3/NgNEDQPjbbBKBQZGADfLDgsAAHicY2BgYGaAYBkGRgYQiAHyGMF8FgYHIM3DwMHABGQzMCQqKClOUJz0/z9YHRLv/+L7D+8V3cuHmgAHjGwM6ELUByxUMIOZCmbgAAA5LQ8XeJxjYGRgYABiO68w73h+m68M3EwMIHC+sKIeTqsyqDLeZrwN5HIwgKUB/aYJUgAAeJxjYGRgYLzNwMCgx8QAAkA2IwMqYAIAMGIB7QIAAAACAAAlACUAJQAlAAAAAFAAAAUAAHicbY49asNAEIU/2ZJDfkiRIvXapUFCEqpcptABUrg3ZhEiQoKVfY9UqVLlGDlADpAT5e16IUWysMz3hjfzBrjjjQT/EjKpCy+4YhN5yZoxcirPe+SMWz4jr6S+5UzSa3VuwpTnBfc8RF7yxDZyKs9r5IxHPiKv1P9iZqDnyAvMQ39UecbScVb/gJO03Xk4CFom3XYK1clhMdQUlKo7/d9NF13RkIdfy+MV7TSe2sl11tRFaXYmJKpWTd7kdVnJ8veevZKc+n3I93t9Jnvr5n4aTVWU/0z9AI2qMkV4nGNgZkAGjAxoAAAAjgAF) format("woff"), url(data:font/ttf;base64,AAEAAAANAIAAAwBQRkZUTW3RyK8AAAdIAAAAHEdERUYANAAGAAAHKAAAACBPUy8yT/b9sgAAAVgAAABWY21hcCIPRb0AAAHIAAABYmdhc3D//wADAAAHIAAAAAhnbHlmP5u2YAAAAzwAAAIsaGVhZAABMfsAAADcAAAANmhoZWED5QIFAAABFAAAACRobXR4BkoASgAAAbAAAAAWbG9jYQD2AaIAAAMsAAAAEG1heHAASwBHAAABOAAAACBuYW1lBSeBwgAABWgAAAFucG9zdC+zMgMAAAbYAAAARQABAAAAAQAA8MQQT18PPPUACwIAAAAAAM9xeH8AAAAAz3F4fwAlACUB2wHbAAAACAACAAAAAAAAAAEAAAHbAAAALgIAAAAAAAHbAAEAAAAAAAAAAAAAAAAAAAAEAAEAAAAHAEQAAgAAAAAAAgAAAAEAAQAAAEAAAAAAAAAAAQIAAZAABQAIAUwBZgAAAEcBTAFmAAAA9QAZAIQAAAIABQkAAAAAAACAAAABAAAAIAAAAAAAAAAAUGZFZABAAGEhkgHg/+AALgHb/9sAAAABAAAAAAAAAgAAAAAAAAACAAAAAgAAJQAlACUAJQAAAAAAAwAAAAMAAAAcAAEAAAAAAFwAAwABAAAAHAAEAEAAAAAMAAgAAgAEAAAAYSAiIZAhkv//AAAAAABhICIhkCGS//8AAP+l3+PedN5xAAEAAAAAAAAAAAAAAAAAAAEGAAABAAAAAAAAAAECAAAAAgAAAAAAAAAAAAAAAAAAAAEAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAFAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABGAIwAsAEWAAIAJQAlAdsB2wAYACwAAD8BNjQvASYjIg8BBhUUHwEHBhUUHwEWMzI2FAcGBwYiJyYnJjQ3Njc2MhcWF/GCBgaCBQcIBR0GBldXBgYdBQgH7x0eMjB8MDIeHR0eMjB8MDIecYIGDgaCBQUeBQcJBFhYBAkHBR4F0nwwMh4dHR4yMHwwMh4dHR4yAAAAAgAlACUB2wHbABgALAAAJTc2NTQvATc2NTQvASYjIg8BBhQfARYzMjYUBwYHBiInJicmNDc2NzYyFxYXASgdBgZXVwYGHQUIBwWCBgaCBQcIuB0eMjB8MDIeHR0eMjB8MDIecR4FBwkEWFgECQcFHgUFggYOBoIF0nwwMh4dHR4yMHwwMh4dHR4yAAABACUAJQHbAdsAEwAAABQHBgcGIicmJyY0NzY3NjIXFhcB2x0eMjB8MDIeHR0eMjB8MDIeAT58MDIeHR0eMjB8MDIeHR0eMgABACUAJQHbAdsAQwAAARUUBisBIicmPwEmIyIHBgcGBwYUFxYXFhcWMzI3Njc2MzIfARYVFAcGBwYjIicmJyYnJjQ3Njc2NzYzMhcWFzc2FxYB2woIgAsGBQkoKjodHBwSFAwLCwwUEhwcHSIeIBMGAQQDJwMCISspNC8mLBobFBERFBsaLCYvKicpHSUIDAsBt4AICgsLCScnCwwUEhwcOhwcEhQMCw8OHAMDJwMDAgQnFBQRFBsaLCZeJiwaGxQRDxEcJQgEBgAAAAAAAAwAlgABAAAAAAABAAUADAABAAAAAAACAAcAIgABAAAAAAADACEAbgABAAAAAAAEAAUAnAABAAAAAAAFAAsAugABAAAAAAAGAAUA0gADAAEECQABAAoAAAADAAEECQACAA4AEgADAAEECQADAEIAKgADAAEECQAEAAoAkAADAAEECQAFABYAogADAAEECQAGAAoAxgBzAGwAaQBjAGsAAHNsaWNrAABSAGUAZwB1AGwAYQByAABSZWd1bGFyAABGAG8AbgB0AEYAbwByAGcAZQAgADIALgAwACAAOgAgAHMAbABpAGMAawAgADoAIAAxADQALQA0AC0AMgAwADEANAAARm9udEZvcmdlIDIuMCA6IHNsaWNrIDogMTQtNC0yMDE0AABzAGwAaQBjAGsAAHNsaWNrAABWAGUAcgBzAGkAbwBuACAAMQAuADAAAFZlcnNpb24gMS4wAABzAGwAaQBjAGsAAHNsaWNrAAAAAAIAAAAAAAAAAAAAAAAAAQAAAAAAAAAAAAAAAAAAAAAABwAAAAEAAgECAQMAhwBECmFycm93cmlnaHQJYXJyb3dsZWZ0AAAAAAAAAf//AAIAAQAAAA4AAAAYAAAAAAACAAEAAwAGAAEABAAAAAIAAAAAAAEAAAAAzu7XsAAAAADPcXh/AAAAAM9xeH8=) format("truetype"), url(data:image/svg+xml;base64,PD94bWwgdmVyc2lvbj0iMS4wIiBzdGFuZGFsb25lPSJubyI/Pgo8IURPQ1RZUEUgc3ZnIFBVQkxJQyAiLS8vVzNDLy9EVEQgU1ZHIDEuMS8vRU4iICJodHRwOi8vd3d3LnczLm9yZy9HcmFwaGljcy9TVkcvMS4xL0RURC9zdmcxMS5kdGQiPgo8c3ZnIHhtbG5zPSJodHRwOi8vd3d3LnczLm9yZy8yMDAwL3N2ZyI+CjxtZXRhZGF0YT5HZW5lcmF0ZWQgYnkgRm9udGFzdGljLm1lPC9tZXRhZGF0YT4KPGRlZnM+Cjxmb250IGlkPSJzbGljayIgaG9yaXotYWR2LXg9IjUxMiI+Cjxmb250LWZhY2UgZm9udC1mYW1pbHk9InNsaWNrIiB1bml0cy1wZXItZW09IjUxMiIgYXNjZW50PSI0ODAiIGRlc2NlbnQ9Ii0zMiIvPgo8bWlzc2luZy1nbHlwaCBob3Jpei1hZHYteD0iNTEyIiAvPgoKPGdseXBoIHVuaWNvZGU9IiYjODU5NDsiIGQ9Ik0yNDEgMTEzbDEzMCAxMzBjNCA0IDYgOCA2IDEzIDAgNS0yIDktNiAxM2wtMTMwIDEzMGMtMyAzLTcgNS0xMiA1LTUgMC0xMC0yLTEzLTVsLTI5LTMwYy00LTMtNi03LTYtMTIgMC01IDItMTAgNi0xM2w4Ny04OC04Ny04OGMtNC0zLTYtOC02LTEzIDAtNSAyLTkgNi0xMmwyOS0zMGMzLTMgOC01IDEzLTUgNSAwIDkgMiAxMiA1eiBtMjM0IDE0M2MwLTQwLTktNzctMjktMTEwLTIwLTM0LTQ2LTYwLTgwLTgwLTMzLTIwLTcwLTI5LTExMC0yOS00MCAwLTc3IDktMTEwIDI5LTM0IDIwLTYwIDQ2LTgwIDgwLTIwIDMzLTI5IDcwLTI5IDExMCAwIDQwIDkgNzcgMjkgMTEwIDIwIDM0IDQ2IDYwIDgwIDgwIDMzIDIwIDcwIDI5IDExMCAyOSA0MCAwIDc3LTkgMTEwLTI5IDM0LTIwIDYwLTQ2IDgwLTgwIDIwLTMzIDI5LTcwIDI5LTExMHoiLz4KPGdseXBoIHVuaWNvZGU9IiYjODU5MjsiIGQ9Ik0yOTYgMTEzbDI5IDMwYzQgMyA2IDcgNiAxMiAwIDUtMiAxMC02IDEzbC04NyA4OCA4NyA4OGM0IDMgNiA4IDYgMTMgMCA1LTIgOS02IDEybC0yOSAzMGMtMyAzLTggNS0xMyA1LTUgMC05LTItMTItNWwtMTMwLTEzMGMtNC00LTYtOC02LTEzIDAtNSAyLTkgNi0xM2wxMzAtMTMwYzMtMyA3LTUgMTItNSA1IDAgMTAgMiAxMyA1eiBtMTc5IDE0M2MwLTQwLTktNzctMjktMTEwLTIwLTM0LTQ2LTYwLTgwLTgwLTMzLTIwLTcwLTI5LTExMC0yOS00MCAwLTc3IDktMTEwIDI5LTM0IDIwLTYwIDQ2LTgwIDgwLTIwIDMzLTI5IDcwLTI5IDExMCAwIDQwIDkgNzcgMjkgMTEwIDIwIDM0IDQ2IDYwIDgwIDgwIDMzIDIwIDcwIDI5IDExMCAyOSA0MCAwIDc3LTkgMTEwLTI5IDM0LTIwIDYwLTQ2IDgwLTgwIDIwLTMzIDI5LTcwIDI5LTExMHoiLz4KPGdseXBoIHVuaWNvZGU9IiYjODIyNjsiIGQ9Ik00NzUgMjU2YzAtNDAtOS03Ny0yOS0xMTAtMjAtMzQtNDYtNjAtODAtODAtMzMtMjAtNzAtMjktMTEwLTI5LTQwIDAtNzcgOS0xMTAgMjktMzQgMjAtNjAgNDYtODAgODAtMjAgMzMtMjkgNzAtMjkgMTEwIDAgNDAgOSA3NyAyOSAxMTAgMjAgMzQgNDYgNjAgODAgODAgMzMgMjAgNzAgMjkgMTEwIDI5IDQwIDAgNzctOSAxMTAtMjkgMzQtMjAgNjAtNDYgODAtODAgMjAtMzMgMjktNzAgMjktMTEweiIvPgo8Z2x5cGggdW5pY29kZT0iJiM5NzsiIGQ9Ik00NzUgNDM5bDAtMTI4YzAtNS0xLTktNS0xMy00LTQtOC01LTEzLTVsLTEyOCAwYy04IDAtMTMgMy0xNyAxMS0zIDctMiAxNCA0IDIwbDQwIDM5Yy0yOCAyNi02MiAzOS0xMDAgMzktMjAgMC0zOS00LTU3LTExLTE4LTgtMzMtMTgtNDYtMzItMTQtMTMtMjQtMjgtMzItNDYtNy0xOC0xMS0zNy0xMS01NyAwLTIwIDQtMzkgMTEtNTcgOC0xOCAxOC0zMyAzMi00NiAxMy0xNCAyOC0yNCA0Ni0zMiAxOC03IDM3LTExIDU3LTExIDIzIDAgNDQgNSA2NCAxNSAyMCA5IDM4IDIzIDUxIDQyIDIgMSA0IDMgNyAzIDMgMCA1LTEgNy0zbDM5LTM5YzItMiAzLTMgMy02IDAtMi0xLTQtMi02LTIxLTI1LTQ2LTQ1LTc2LTU5LTI5LTE0LTYwLTIwLTkzLTIwLTMwIDAtNTggNS04NSAxNy0yNyAxMi01MSAyNy03MCA0Ny0yMCAxOS0zNSA0My00NyA3MC0xMiAyNy0xNyA1NS0xNyA4NSAwIDMwIDUgNTggMTcgODUgMTIgMjcgMjcgNTEgNDcgNzAgMTkgMjAgNDMgMzUgNzAgNDcgMjcgMTIgNTUgMTcgODUgMTcgMjggMCA1NS01IDgxLTE1IDI2LTExIDUwLTI2IDcwLTQ1bDM3IDM3YzYgNiAxMiA3IDIwIDQgOC00IDExLTkgMTEtMTd6Ii8+CjwvZm9udD48L2RlZnM+PC9zdmc+Cg==#slick) format("svg");
  font-weight: normal;
  font-style: normal; }

/* Arrows */
.slick-prev,
.slick-next {
  position: absolute;
  display: block;
  height: 20px;
  width: 20px;
  line-height: 0px;
  font-size: 0px;
  cursor: pointer;
  background: transparent;
  color: transparent;
  top: 50%;
  -webkit-transform: translate(0, -50%);
  -ms-transform: translate(0, -50%);
  transform: translate(0, -50%);
  padding: 0;
  border: none;
  outline: none; }
  .slick-prev:hover, .slick-prev:focus,
  .slick-next:hover,
  .slick-next:focus {
    outline: none;
    background: transparent;
    color: transparent; }
    .slick-prev:hover:before, .slick-prev:focus:before,
    .slick-next:hover:before,
    .slick-next:focus:before {
      opacity: 1; }
  .slick-prev.slick-disabled:before,
  .slick-next.slick-disabled:before {
    opacity: 0.25; }
  .slick-prev:before,
  .slick-next:before {
    font-family: "slick";
    font-size: 20px;
    line-height: 1;
    color: white;
    opacity: 0.75;
    -webkit-font-smoothing: antialiased;
    -moz-osx-font-smoothing: grayscale; }

.slick-prev {
  left: -25px; }
  [dir="rtl"] .slick-prev {
    left: auto;
    right: -25px; }
  .slick-prev:before {
    content: "\2190"; }
    [dir="rtl"] .slick-prev:before {
      content: "\2192"; }

.slick-next {
  right: -25px; }
  [dir="rtl"] .slick-next {
    left: -25px;
    right: auto; }
  .slick-next:before {
    content: "\2192"; }
    [dir="rtl"] .slick-next:before {
      content: "\2190"; }

/* Dots */
.slick-dotted.slick-slider {
  margin-bottom: 30px; }

.slick-dots {
  position: absolute;
  bottom: -25px;
  list-style: none;
  display: block;
  text-align: center;
  padding: 0;
  margin: 0;
  width: 100%; }
  .slick-dots li {
    position: relative;
    display: inline-block;
    height: 20px;
    width: 20px;
    margin: 0 5px;
    padding: 0;
    cursor: pointer; }
    .slick-dots li button {
      border: 0;
      background: transparent;
      display: block;
      height: 20px;
      width: 20px;
      outline: none;
      line-height: 0px;
      font-size: 0px;
      color: transparent;
      padding: 5px;
      cursor: pointer; }
      .slick-dots li button:hover, .slick-dots li button:focus {
        outline: none; }
        .slick-dots li button:hover:before, .slick-dots li button:focus:before {
          opacity: 1; }
      .slick-dots li button:before {
        position: absolute;
        top: 0;
        left: 0;
        content: "\2022";
        width: 20px;
        height: 20px;
        font-family: "slick";
        font-size: 6px;
        line-height: 20px;
        text-align: center;
        color: black;
        opacity: 0.25;
        -webkit-font-smoothing: antialiased;
        -moz-osx-font-smoothing: grayscale; }
    .slick-dots li.slick-active button:before {
      color: black;
      opacity: 0.75; }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
.carousel {
  margin-bottom: 0;
  padding: 12px 45px; }
  .box-content .carousel {
    padding: 12px 25px; }
  .carousel .slick-next,
  .carousel .slick-prev {
    margin-top: -20px;
    width: 40px;
    height: 40px; }
    .carousel .slick-next:before,
    .carousel .slick-prev:before {
      display: block;
      background-repeat: no-repeat;
      background-position: center center;
      background-size: 70%;
      width: 40px;
      height: 40px;
      font-size: 40px;
      content: ""; }
    .carousel .slick-next.slick-disabled:before,
    .carousel .slick-prev.slick-disabled:before {
      opacity: 1; }
  .carousel .slick-prev {
    left: 0; }
    .carousel .slick-prev:before {
      background-image: url("/svgs/carousel/prev_ui-dark-gray.svg"); }
      .carousel .slick-prev:before:hover {
        background-image: url("/svgs/carousel/prev_ui-blue.svg");
        background-size: 90%; }
    .box-content .carousel .slick-prev {
      left: -20px; }
  .carousel .slick-next {
    right: 0; }
    .carousel .slick-next:before {
      background-image: url("/svgs/carousel/next_ui-dark-gray.svg"); }
      .carousel .slick-next:before:hover {
        background-image: url("/svgs/carousel/next_ui-blue.svg");
        background-size: 90%; }
    .box-content .carousel .slick-next {
      right: -20px; }
  .carousel .slick-slide {
    padding-right: 30px; }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
.banner {
  position: fixed;
  top: 50px;
  z-index: 9;
  box-shadow: 0 1px 1px #b3b3b3;
  background-color: #ffab1a;
  width: 100%;
  overflow: hidden;
  text-align: center;
  line-height: 50px; }
  .banner,
  .banner a {
    color: white; }
  .banner a {
    text-decoration: underline; }
  .banner .close {
    float: right;
    margin-top: 12.5px;
    border-radius: 12.5px;
    background-color: rgba(0, 0, 0, 0.25);
    width: 25px;
    height: 25px;
    text-decoration: none;
    text-shadow: none;
    line-height: 25px;
    color: white;
    font-weight: normal; }
  .banner.warning {
    background-color: #ffab1a; }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
/*
    Frameless           <http://framelessgrid.com/>
    by Joni Korpi       <http://jonikorpi.com/>
    licensed under CC0  <http://creativecommons.org/publicdomain/zero/1.0/>
*/
/* Media Queries */
/* Width */
/*
* ... small | medium     | intermediate | big ...
* ... medium-and-smaller |
*          ... intermediate-and-smaller |
*/
/* Height */
@media only screen and (max-width: 479px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 100%; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 480px; } }

@media only screen and (min-width: 768px) and (max-width: 941px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 768px; } }

@media only screen and (min-width: 942px) {
  .inner {
    margin: 0 auto;
    width: 942px; } }

.video-player {
  border: 0.25rem solid rgba(0, 0, 0, 0.15);
  border-radius: .75rem;
  height: 225px;
  overflow: hidden; }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
/*
    Frameless           <http://framelessgrid.com/>
    by Joni Korpi       <http://jonikorpi.com/>
    licensed under CC0  <http://creativecommons.org/publicdomain/zero/1.0/>
*/
/* Media Queries */
/* Width */
/*
* ... small | medium     | intermediate | big ...
* ... medium-and-smaller |
*          ... intermediate-and-smaller |
*/
/* Height */
@media only screen and (max-width: 479px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 100%; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 480px; } }

@media only screen and (min-width: 768px) and (max-width: 941px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 768px; } }

@media only screen and (min-width: 942px) {
  .inner {
    margin: 0 auto;
    width: 942px; } }

.intro-banner {
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column;
  position: relative;
  padding: 0;
  -webkit-justify-content: space-between;
      -ms-flex-pack: justify;
          justify-content: space-between;
  background-color: white;
  /* flex: column */ }
  .intro-banner .intro-container {
    min-height: 24rem;
    -webkit-justify-content: space-between;
        -ms-flex-pack: justify;
            justify-content: space-between;
    background-color: #4d97ff;
    background-size: auto;
    background-repeat: no-repeat;
    background-position: right;
    background-image: url("/svgs/intro/background-cropped.svg"); }
  .intro-banner .intro-content {
    -webkit-flex: 1;
        -ms-flex: 1;
            flex: 1;
    -webkit-justify-content: center;
        -ms-flex-pack: center;
            justify-content: center;
    -webkit-align-items: flex-start;
        -ms-flex-align: start;
                -ms-grid-row-align: flex-start;
            align-items: flex-start;
    margin-left: 5%;
    min-height: 20rem; }
  .intro-banner .intro-video-container {
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    -webkit-justify-content: center;
        -ms-flex-pack: center;
            justify-content: center;
    -webkit-align-items: center;
        -ms-flex-align: center;
            align-items: center;
    -webkit-flex: 0 0 29rem;
        -ms-flex: 0 0 29rem;
            flex: 0 0 29rem; }
    .intro-banner .intro-video-container .intro-video {
      margin-right: 4rem; }
    .intro-banner .intro-video-container .video-image {
      position: relative;
      cursor: pointer;
      margin-right: 4rem; }
      .intro-banner .intro-video-container .video-image .watch-button {
        position: absolute;
        bottom: 0;
        left: 50%;
        -webkit-transform: translate(-50%, 50%);
            -ms-transform: translate(-50%, 50%);
                transform: translate(-50%, 50%);
        border-radius: 4px;
        background-color: rgba(0, 0, 0, 0.15);
        box-shadow: 0 0 0 4px rgba(0, 0, 0, 0.15);
        color: white;
        padding: .625rem .75rem;
        font-size: 1rem; }
    .intro-banner .intro-video-container:after {
      display: block;
      position: absolute;
      bottom: .75rem;
      right: 10%;
      background-image: url("/svgs/intro/hat-block.svg");
      background-repeat: no-repeat;
      width: 122px;
      height: 81px;
      content: ""; }
  .intro-banner .intro-header {
    margin-bottom: .75rem;
    font-size: 2rem;
    color: white;
    line-height: 1.5em; }
  .intro-banner .intro-button {
    border-radius: 4px;
    background-color: white;
    color: #4d97ff;
    padding: .625rem .75rem;
    font-size: 1rem;
    margin-right: .75rem; }
    .intro-banner .intro-button.create-button:before {
      display: inline-block;
      margin-right: .5rem;
      background-repeat: no-repeat;
      background-position: center center;
      background-size: contain;
      background-image: url("/svgs/intro/create.svg");
      width: 1.5rem;
      height: 1.5rem;
      vertical-align: -.35rem;
      content: ""; }
    .intro-banner .intro-button.join-button:before {
      display: inline-block;
      margin-right: .5rem;
      background-repeat: no-repeat;
      background-position: center center;
      background-size: contain;
      background-image: url("/svgs/intro/join.svg");
      width: 1.5rem;
      height: 1.5rem;
      vertical-align: -.35rem;
      content: ""; }
  .intro-banner .intro-subnav {
    -webkit-justify-content: center;
        -ms-flex-pack: center;
            justify-content: center;
    background-color: rgba(77, 151, 255, 0.1); }
    .intro-banner .intro-subnav .subnav-button {
      margin: .625rem .5rem;
      padding: .5rem 1.5rem;
      border-radius: 1.5rem; }

@media only screen and (min-width: 900px) and (max-width: 1023px) {
  .intro-banner .intro-header {
    max-width: 22rem;
    text-align: left; } }

@media only screen and (min-width: 480px) and (max-width: 899px) {
  .intro-banner {
    -webkit-justify-content: flex-start;
        -ms-flex-pack: start;
            justify-content: flex-start; }
    .intro-banner .intro-header {
      margin-top: 1.75rem;
      font-size: 1.5rem; }
    .intro-banner .intro-container {
      -webkit-flex-direction: column;
          -ms-flex-direction: column;
              flex-direction: column;
      background-position: bottom 32px right 50%;
      background-size: 40rem;
      background-image: url("/svgs/intro/background.svg"); }
      .intro-banner .intro-container .intro-content {
        -webkit-align-items: center;
            -ms-flex-align: center;
                    -ms-grid-row-align: center;
                align-items: center;
        min-height: 8rem;
        margin: 0; }
    .intro-banner .intro-video-container {
      -webkit-flex: 0 0 24rem;
          -ms-flex: 0 0 24rem;
              flex: 0 0 24rem; }
      .intro-banner .intro-video-container .video-image,
      .intro-banner .intro-video-container .video-player {
        margin: 0; }
      .intro-banner .intro-video-container:after {
        display: none; } }

@media only screen and (max-width: 767px) {
  .intro-buttons,
  .intro-subnav {
    -webkit-flex-direction: row;
        -ms-flex-direction: row;
            flex-direction: row; } }

@media only screen and (max-width: 479px) {
  .intro-banner .intro-container {
    background-image: none; }
    .intro-banner .intro-container .intro-content.column {
      margin: auto 5%;
      -webkit-align-items: center;
          -ms-flex-align: center;
                  -ms-grid-row-align: center;
              align-items: center; }
    .intro-banner .intro-container .intro-header {
      font-size: 1.5rem; }
    .intro-banner .intro-container .intro-video-container {
      display: none; } }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
.news ul {
  display: block;
  margin: 0;
  padding: 0;
  list-style: none; }

.news li {
  display: block;
  clear: both;
  margin: 0;
  padding: 12px 0;
  min-height: 53px; }
  .news li a {
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    text-decoration: none;
    -webkit-flex-wrap: nowrap;
        -ms-flex-wrap: nowrap;
            flex-wrap: nowrap;
    -webkit-flex-direction: row;
        -ms-flex-direction: row;
            flex-direction: row; }
    .news li a:hover {
      text-decoration: none; }
  .news li img {
    margin-right: 12px;
    width: initial; }
  .news li h4 {
    display: block;
    color: #4d97ff;
    font-size: .85rem; }
  .news li p {
    display: block;
    margin: 0;
    padding: 0;
    line-height: normal;
    color: #575e75;
    font-size: .85rem; }
  .news li:nth-child(even) {
    border-top: 1px solid #d9d9d9;
    border-bottom: 1px solid #d9d9d9; }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
/*
    Frameless           <http://framelessgrid.com/>
    by Joni Korpi       <http://jonikorpi.com/>
    licensed under CC0  <http://creativecommons.org/publicdomain/zero/1.0/>
*/
/* Media Queries */
/* Width */
/*
* ... small | medium     | intermediate | big ...
* ... medium-and-smaller |
*          ... intermediate-and-smaller |
*/
/* Height */
@media only screen and (max-width: 479px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 100%; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 480px; } }

@media only screen and (min-width: 768px) and (max-width: 941px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 768px; } }

@media only screen and (min-width: 942px) {
  .inner {
    margin: 0 auto;
    width: 942px; } }

.teacher-banner {
  background-color: #9966ff;
  min-height: 65px; }
  .teacher-banner.title-banner {
    transition: none;
    margin-bottom: 0;
    text-align: left; }
    .teacher-banner.title-banner h3,
    .teacher-banner.title-banner p {
      margin: 0;
      padding: 0;
      width: 100%;
      text-align: left; }
  .teacher-banner h3 {
    color: white; }
  .teacher-banner .flex-row.inner {
    -webkit-justify-content: space-between;
        -ms-flex-pack: justify;
            justify-content: space-between; }
  .teacher-banner .button {
    margin-left: 10px;
    background-color: white;
    padding: 13px 20px;
    color: #4d97ff; }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
.welcome .box-content {
  padding: 0; }

.welcome .welcome-col {
  display: inline-block;
  margin: 10px 15px;
  width: 150px;
  height: 253px; }
  .welcome .welcome-col h4 {
    margin-top: 12px;
    padding: 0;
    font-weight: 200; }
  .welcome .welcome-col > a {
    display: block;
    margin-top: 20px;
    margin-bottom: 35px;
    height: 100px; }
  .welcome .welcome-col h4:before, .welcome .welcome-col > a:after {
    display: block;
    margin: 10px 0;
    border-radius: 5px;
    width: 100%;
    height: 10px;
    content: ""; }
  .welcome .welcome-col img {
    display: block;
    max-width: 133px;
    max-height: 100px; }
  .welcome .welcome-col.blue h4:before, .welcome .welcome-col.blue > a:after {
    background-color: #4d97ff; }
  .welcome .welcome-col.blue a {
    color: #4d97ff; }
  .welcome .welcome-col.blue img {
    margin-left: 4px; }
  .welcome .welcome-col.green h4:before, .welcome .welcome-col.green > a:after {
    background-color: #0fbd8c; }
  .welcome .welcome-col.green a {
    color: #0fbd8c; }
  .welcome .welcome-col.pink h4:before, .welcome .welcome-col.pink > a:after {
    background-color: #9966ff; }
  .welcome .welcome-col.pink a {
    color: #9966ff; }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
/*
    Frameless           <http://framelessgrid.com/>
    by Joni Korpi       <http://jonikorpi.com/>
    licensed under CC0  <http://creativecommons.org/publicdomain/zero/1.0/>
*/
/* Media Queries */
/* Width */
/*
* ... small | medium     | intermediate | big ...
* ... medium-and-smaller |
*          ... intermediate-and-smaller |
*/
/* Height */
@media only screen and (max-width: 479px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 100%; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 480px; } }

@media only screen and (min-width: 768px) and (max-width: 941px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 768px; } }

@media only screen and (min-width: 942px) {
  .inner {
    margin: 0 auto;
    width: 942px; } }

.social-message {
  margin: 0;
  border-bottom: 1px solid #d9d9d9;
  padding: 1rem;
  list-style-type: none; }

.social-message-icon {
  opacity: .25; }

.social-message.mod-unread {
  background-color: rgba(77, 151, 255, 0.1); }

.social-message.mod-unread .social-message-icon {
  opacity: 1; }

.flex-row.mod-social-message {
  -webkit-justify-content: space-between;
      -ms-flex-pack: justify;
          justify-content: space-between;
  -webkit-align-items: flex-start;
      -ms-flex-align: start;
              -ms-grid-row-align: flex-start;
          align-items: flex-start; }

.social-message-content {
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  max-width: 38.75rem;
  text-align: left;
  -webkit-align-items: flex-start;
      -ms-flex-align: start;
          align-items: flex-start; }

.social-message-icon {
  margin: .2rem 1rem 0 0;
  min-width: 1.25rem; }

a.social-messages-profile-link {
  color: #575e75; }
  a.social-messages-profile-link:hover {
    color: #4d97ff; }

.flex-row.mod-comment-message {
  -webkit-justify-content: flex-start;
      -ms-flex-pack: start;
          justify-content: flex-start; }

.comment-text {
  margin-left: 1.5rem; }

@media only screen and (max-width: 479px) {
  .social-message {
    text-align: left; }
  .social-message-date {
    -webkit-align-self: flex-end;
        -ms-flex-item-align: end;
            align-self: flex-end; }
  .social-message-content {
    max-width: 100%; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  .social-message {
    text-align: left; }
  .social-message-date {
    -webkit-align-self: flex-end;
        -ms-flex-item-align: end;
            align-self: flex-end; }
  .social-message-content {
    max-width: 100%; } }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
/*
    Frameless           <http://framelessgrid.com/>
    by Joni Korpi       <http://jonikorpi.com/>
    licensed under CC0  <http://creativecommons.org/publicdomain/zero/1.0/>
*/
/* Media Queries */
/* Width */
/*
* ... small | medium     | intermediate | big ...
* ... medium-and-smaller |
*          ... intermediate-and-smaller |
*/
/* Height */
@media only screen and (max-width: 479px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 100%; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 480px; } }

@media only screen and (min-width: 768px) and (max-width: 941px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 768px; } }

@media only screen and (min-width: 942px) {
  .inner {
    margin: 0 auto;
    width: 942px; } }

.hoc-banner {
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  position: relative;
  background-color: #0fbd8c;
  background-image: url("/images/hoc/bg-pattern.png");
  background-size: cover;
  padding: 0;
  height: 25rem;
  overflow: hidden;
  -webkit-justify-content: center;
      -ms-flex-pack: center;
          justify-content: center; }
  .hoc-banner.mod-middle-banner {
    background-color: #cf63cf; }
  .hoc-banner .hoc-container {
    margin: auto;
    width: 942px;
    height: 25rem;
    -webkit-justify-content: flex-start;
        -ms-flex-pack: start;
            justify-content: flex-start; }
    .hoc-banner .hoc-container .hoc-title-container {
      margin: 1.5rem 0;
      width: 100%;
      -webkit-justify-content: space-between;
          -ms-flex-pack: justify;
              justify-content: space-between; }
  .hoc-banner .hoc-banner-images {
    display: -webkit-flex;
    display: -ms-flexbox;
    display: flex;
    width: 942px;
    -webkit-justify-content: space-between;
        -ms-flex-pack: justify;
            justify-content: space-between; }
  .hoc-banner .hoc-banner-image {
    border: 2px solid #0fbd8c;
    border-radius: 16px;
    background-color: white;
    width: 18.75em;
    height: 244px;
    overflow: hidden;
    box-sizing: border-box;
    -webkit-justify-content: flex-start;
        -ms-flex-pack: start;
            justify-content: flex-start; }
    .hoc-banner .hoc-banner-image.mod-middle-image {
      border: 2px solid #cf63cf; }
    .hoc-banner .hoc-banner-image img {
      width: 18.75em;
      height: 10.375em;
      /* images are 600 x 332 for retina */
      object-fit: cover; }
    .hoc-banner .hoc-banner-image .hoc-image-text {
      margin: auto auto;
      color: #4d97ff;
      font-size: 1rem;
      font-weight: bold; }
  .hoc-banner .hoc-header {
    color: white; }
  .hoc-banner .hoc-header {
    font-size: 2rem; }
  .hoc-banner .hoc-more-activities {
    border-radius: 10px;
    background-color: white;
    padding: .5rem 1rem .75rem 1rem;
    color: #4d97ff;
    font-size: .75rem;
    font-weight: bold; }
    .hoc-banner .hoc-more-activities img {
      margin-right: .25rem;
      width: 20px;
      height: 20px;
      vertical-align: text-bottom; }

@media only screen and (min-width: 768px) and (max-width: 942px) {
  .hoc-banner {
    height: 23.5rem; }
    .hoc-banner .hoc-container {
      bottom: 4rem;
      width: 768px; }
    .hoc-banner .hoc-banner-images {
      width: 768px; }
    .hoc-banner .hoc-banner-image {
      width: 18.75em; }
  .hoc-hideable {
    display: none; } }
</style><style type="text/css">/* UI Primary Colors */
/* #FF661A */
/* UI Secondary Colors */
/* 3.0 colors */
/* Using www naming convention for now, should be consistent with gui */
/* #CF63CF Sounds Primary */
/* modals */
/* Overlay UI Gray Colors */
/* Typography Colors */
/* Down Deep */
/*
    Frameless           <http://framelessgrid.com/>
    by Joni Korpi       <http://jonikorpi.com/>
    licensed under CC0  <http://creativecommons.org/publicdomain/zero/1.0/>
*/
/* Media Queries */
/* Width */
/*
* ... small | medium     | intermediate | big ...
* ... medium-and-smaller |
*          ... intermediate-and-smaller |
*/
/* Height */
@media only screen and (max-width: 479px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 100%; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 480px; } }

@media only screen and (min-width: 768px) and (max-width: 941px) {
  #view {
    text-align: center; }
  .inner {
    margin: 0 auto;
    width: 768px; } }

@media only screen and (min-width: 942px) {
  .inner {
    margin: 0 auto;
    width: 942px; } }

#view {
  padding: 0; }

.inner.mod-splash {
  margin-top: 20px; }

.splash .splash-header {
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  -webkit-flex-direction: row;
      -ms-flex-direction: row;
          flex-direction: row;
  -webkit-flex-wrap: nowrap;
      -ms-flex-wrap: nowrap;
          flex-wrap: nowrap;
  -webkit-justify-content: space-between;
      -ms-flex-pack: justify;
          justify-content: space-between; }
  .ie9 .splash .splash-header {
    display: table;
    margin: 0 -20px 20px -20px;
    min-width: 100%;
    border-spacing: 20px 0; }
  .splash .splash-header .box {
    display: inline-block;
    width: calc(60% - 20px); }
    .ie9 .splash .splash-header .box {
      display: table-cell;
      vertical-align: top; }
  .splash .splash-header .news {
    width: 40%; }
    .splash .splash-header .news img {
      -webkit-flex-shrink: 0;
          -ms-flex-negative: 0;
              flex-shrink: 0; }

.splash .box {
  margin-bottom: 20px; }

.splash-admin-panel dl {
  list-style: none; }
  .splash-admin-panel dl dt {
    margin: 2rem 0 1rem 0;
    border-bottom: 1px solid #b3b3b3;
    font-size: large;
    font-weight: 700; }
  .splash-admin-panel dl dd {
    margin-left: 0; }

.splash-admin-panel ul {
  padding: 0; }
  .splash-admin-panel ul li {
    margin: 0;
    list-style: none; }

.modal-content.mod-confirmation {
  width: 31.25rem; }

.modal-content-iframe.mod-confirmation {
  border-radius: 1rem;
  width: 31.25rem;
  min-height: 20.625rem; }

.activity-ul {
  margin: 0;
  padding: 0; }

.activity-li {
  display: -webkit-flex;
  display: -ms-flexbox;
  display: flex;
  margin: .75rem 0;
  list-style: none;
  -webkit-align-items: center;
      -ms-flex-align: center;
          align-items: center; }

.flex-row.mod-social-message {
  line-height: 1.25rem;
  -webkit-flex-direction: column;
      -ms-flex-direction: column;
          flex-direction: column; }

.social-message {
  border: 0;
  padding: 0;
  overflow-wrap: anywhere;
  word-break: break-word; }

.activity-img {
  padding-right: .825rem;
  width: 2rem;
  height: 2rem;
  vertical-align: middle; }

.social-message-content {
  font-size: .9rem; }

.social-message-date {
  color: #b3b3b3;
  font-size: .65rem; }

@media only screen and (max-width: 479px) {
  .splash .splash-header {
    -webkit-flex-wrap: wrap;
        -ms-flex-wrap: wrap;
            flex-wrap: wrap;
    -webkit-justify-content: center;
        -ms-flex-pack: center;
            justify-content: center; }
    .splash .splash-header .box {
      width: 18.75em; }
  .modal-content.mod-confirmation {
    width: 100%;
    overflow: scroll; }
  .modal-content-iframe.mod-confirmation {
    border-radius: 0; } }

@media only screen and (min-width: 480px) and (max-width: 767px) {
  .splash .splash-header {
    -webkit-flex-wrap: wrap;
        -ms-flex-wrap: wrap;
            flex-wrap: wrap;
    -webkit-justify-content: center;
        -ms-flex-pack: center;
            justify-content: center; }
    .splash .splash-header .box {
      width: 28.75em; }
  .modal-content.mod-confirmation {
    width: 100%;
    overflow: scroll; }
  .modal-content-iframe.mod-confirmation {
    border-radius: 0;
    width: 639px; } }

@media only screen and (min-width: 768px) and (max-width: 941px) {
  .splash .splash-header {
    margin: 0 auto;
    width: 38.75em; } }
</style></head><link rel="stylesheet" data-addon-id="infinite-scroll" data-addon-index="25" class="scratch-addons-style" href="chrome-extension://fbeffbjdlemaoicjdapfpikkikjoneco/addons/infinite-scroll/userscript.css">

    <body>
        <noscript>
            <p>Your browser has Javascript disabled. Please go to your browser preferences and enable Javascript in order to use Scratch.</p>
        </noscript>
        <div id="app"><div class="page"><div class="" id="navigation"><div class="inner logged-in"><ul><li class="logo"><a aria-label="Scratch" href="/"></a></li><li class="link create"><a href="/projects/editor/"><span>Create</span></a></li><li class="link explore"><a href="/explore/projects/all"><span>Explore</span></a></li><li class="link ideas"><a href="/ideas"><span>Ideas</span></a></li><li class="link about"><a href="/about"><span>About</span></a></li><li class="search"><form class="form" novalidate=""><button class="button btn-search" type="submit"></button><div class="form-group row no-label"><label class="control-label col-sm-3" data-required="false" for="frc-q-1088"></label><div class="col-sm-9"><input class="input" aria-label="Search" name="q" placeholder="Search" type="text" id="frc-q-1088" value=""><span class="help-block">Not Required</span></div></div></form></li><li class="link right messages"><a href="/messages/" title="Messages"><span class="message-count">0 </span><span>Messages</span></a></li><li class="link right mystuff"><a href="/mystuff/" title="My Stuff"><span>My Stuff</span></a></li><li class="link right account-nav"><div class="account-nav"><a class="ignore-react-onclickoutside user-info" href="#"><img class="avatar" alt="" src="//cdn2.scratch.mit.edu/get_image/user/68203446_32x32.png"><span class="profile-name">Splurtex_Test</span></a><ul class="dropdown production"><li><a href="/users/Splurtex_Test/"><span>Profile</span></a></li><li><a href="/mystuff/"><span>My Stuff</span></a></li><li><a href="/accounts/settings/"><span>Account settings</span></a></li><li class="divider"><a href="#"><span>Sign out</span></a></li></ul></div></li></ul></div></div><div id="view"><div class="splash"><div class="inner mod-splash"><div class="splash-header"><div class="box activity"><div class="box-header"><h4>What's Happening?</h4><h5></h5><p><a></a></p></div><div class="box-content"><ul class="activity-ul"><li class="activity-li"><a href="/users/Splurtex/"><img alt="" class="activity-img" src="//uploads.scratch.mit.edu/users/avatars/66228426.png"></a><div class="social-message mod-love-project"><div class="flex-row mod-social-message"><div class="social-message-content"><div><span><a href="/users/Splurtex">Splurtex</a> loved <a href="/projects/139457120">Icon Mosaic Art!　アイコンモザイクアート!</a></span></div></div><span class="social-message-date"><span>11 hours ago</span></span></div></div></li><li class="activity-li"><a href="/users/Splurtex/"><img alt="" class="activity-img" src="//uploads.scratch.mit.edu/users/avatars/66228426.png"></a><div class="social-message mod-love-favorite"><div class="flex-row mod-social-message"><div class="social-message-content"><div><span><a href="/users/Splurtex">Splurtex</a> favorited <a href="/projects/139457120">Icon Mosaic Art!　アイコンモザイクアート!</a></span></div></div><span class="social-message-date"><span>11 hours ago</span></span></div></div></li><li class="activity-li"><a href="/users/The_Updator/"><img alt="" class="activity-img" src="//uploads.scratch.mit.edu/users/avatars/6773202.png"></a><div class="social-message mod-love-project"><div class="flex-row mod-social-message"><div class="social-message-content"><div><span><a href="/users/The_Updator">The_Updator</a> loved <a href="/projects/524003158">Stickman Animating Practice </a></span></div></div><span class="social-message-date"><span>14 hours ago</span></span></div></div></li><li class="activity-li"><a href="/users/Splurtex/"><img alt="" class="activity-img" src="//uploads.scratch.mit.edu/users/avatars/66228426.png"></a><div class="social-message mod-love-project"><div class="flex-row mod-social-message"><div class="social-message-content"><div><span><a href="/users/Splurtex">Splurtex</a> loved <a href="/projects/522556450">FanA®t for WazzoTV </a></span></div></div><span class="social-message-date"><span>23 hours ago</span></span></div></div></li><li class="activity-li"><a href="/users/Splurtex/"><img alt="" class="activity-img" src="//uploads.scratch.mit.edu/users/avatars/66228426.png"></a><div class="social-message mod-love-favorite"><div class="flex-row mod-social-message"><div class="social-message-content"><div><span><a href="/users/Splurtex">Splurtex</a> favorited <a href="/projects/522556450">FanA®t for WazzoTV </a></span></div></div><span class="social-message-date"><span>23 hours ago</span></span></div></div></li></ul></div></div><div class="box news"><div class="box-header"><h4>Scratch News</h4><h5></h5><p><a href="/discuss/5/">View All</a></p></div><div class="box-content"><ul><li><a href="https://www.youtube.com/watch?v=-3oCdNIeU_8"><img alt="" class="news-image" height="53" src="https://64.media.tumblr.com/0c444169f3181f3942f865abc52c9eeb/9448066e5bb01e6a-2d/s540x810/b65a6d7c2939ef949832d5adec1a644089d12c21.png" width="53"><div class="news-description"><h4>Make a Character Designer Tutorial</h4><p>Want to make an avatar creator? Check out our new tutorial!</p></div></a></li><li><a href="https://scratch.mit.edu/discuss/topic/509069/"><img alt="" class="news-image" height="53" src="https://64.media.tumblr.com/9a68a4b4b0a7d129dfa331eaf0b1f6c7/4bccd762ded1c56a-5a/s540x810/102d0bb0b44b9ce5f67e631d3c60aaf5141905d1.png" width="53"><div class="news-description"><h4>Wiki Wednesday!</h4><p>Check out the new Wiki Wednesday forum post, a news series highlighting the Scratch Wiki!</p></div></a></li><li><a href="https://scratch.mit.edu/studios/29275132/"><img alt="" class="news-image" height="53" src="https://64.media.tumblr.com/b88ede539189dba2642eff1d1c3644ab/01bb8fab7efd43ac-af/s540x810/307a9469c5c2abf7647d07ac4d2064b883ee34ac.png" width="53"><div class="news-description"><h4>New Scratch Design Studio!</h4><p>Come explore the possibilities of a world without color in this new Scratch Design Studio!</p></div></a></li></ul></div></div></div><div class="box"><div class="box-header"><h4>Featured Projects</h4><h5></h5><p><a></a></p></div><div class="box-content"><div class="slick-initialized slick-slider carousel"><button type="button" data-role="none" class="slick-arrow slick-prev slick-disabled" style="display: block;"> Previous</button><div class="slick-list"><div class="slick-track" style="opacity: 1; transform: translate3d(0px, 0px, 0px); width: 2940px;"><div class="thumbnail project slick-slide slick-active"><a class="thumbnail-image" href="/projects/523017931/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/523017931.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/523017931/" title="Ton zu Bild 15.1">Ton zu Bild 15.1</a><div class="thumbnail-creator"><a href="/users/EKNr1/">EKNr1</a></div></div></div></div><div class="thumbnail project slick-slide slick-active"><a class="thumbnail-image" href="/projects/481146596/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/481146596.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/481146596/" title="❤ Spring animation ❤">❤ Spring animation ❤</a><div class="thumbnail-creator"><a href="/users/Fifi_sunshine/">Fifi_sunshine</a></div></div></div></div><div class="thumbnail project slick-slide slick-active"><a class="thumbnail-image" href="/projects/139457120/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/13945/7120.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/139457120/" title="Icon Mosaic Art!　アイコンモザイクアート!">Icon Mosaic Art!　アイコンモザイクアート!</a><div class="thumbnail-creator"><a href="/users/yukku/">yukku</a></div></div></div></div><div class="thumbnail project slick-slide slick-active"><a class="thumbnail-image" href="/projects/522713093/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/522713093.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/522713093/" title="The Silhouettes- An Art Game">The Silhouettes- An Art Game</a><div class="thumbnail-creator"><a href="/users/2GS6/">2GS6</a></div></div></div></div><div class="thumbnail project slick-slide"><a class="thumbnail-image" href="/projects/520274912/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/520274912.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/520274912/" title="ROTATIO - Flowering Night (Violin/Piano Ver)">ROTATIO - Flowering Night (Violin/Piano Ver)</a><div class="thumbnail-creator"><a href="/users/Henry_da_Cat/">Henry_da_Cat</a></div></div></div></div><div data-index="5" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="6" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="7" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="8" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="9" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="10" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="11" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="12" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="13" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="14" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="15" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="16" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="17" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="18" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="19" class="slick-slide" tabindex="-1" style="outline: none;"></div></div></div><button type="button" data-role="none" class="slick-arrow slick-next" style="display: block;"> Next</button></div></div></div><div class="box"><div class="box-header"><h4>Featured Studios</h4><h5></h5><p><a></a></p></div><div class="box-content"><div class="slick-initialized slick-slider carousel"><button type="button" data-role="none" class="slick-arrow slick-prev slick-disabled" style="display: block;"> Previous</button><div class="slick-list"><div class="slick-track" style="opacity: 1; transform: translate3d(0px, 0px, 0px); width: 1365px;"><div class="thumbnail gallery slick-slide slick-active"><a class="thumbnail-image" href="/studios/29581455/"><img alt="" src="//uploads.scratch.mit.edu/galleries/thumbnails/29581455.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/studios/29581455/" title="Asian and Pacific Islander Heritage Month">Asian and Pacific Islander Heritage Month</a></div></div></div><div class="thumbnail gallery slick-slide slick-active"><a class="thumbnail-image" href="/studios/29443801/"><img alt="" src="//uploads.scratch.mit.edu/galleries/thumbnails/29443801.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/studios/29443801/" title="                             ~The Mango Farm~">                             ~The Mango Farm~</a></div></div></div><div class="thumbnail gallery slick-slide slick-active"><a class="thumbnail-image" href="/studios/29454192/"><img alt="" src="//uploads.scratch.mit.edu/galleries/thumbnails/29454192.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/studios/29454192/" title="The Carnivals Studio">The Carnivals Studio</a></div></div></div><div class="thumbnail gallery slick-slide slick-active"><a class="thumbnail-image" href="/studios/29265410/"><img alt="" src="//uploads.scratch.mit.edu/galleries/thumbnails/29265410.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/studios/29265410/" title="Remix-Friendly Projects">Remix-Friendly Projects</a></div></div></div><div class="thumbnail gallery slick-slide"><a class="thumbnail-image" href="/studios/29411864/"><img alt="" src="//uploads.scratch.mit.edu/galleries/thumbnails/29411864.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/studios/29411864/" title="《 The Thespians (and voice actors) of Scratch 》">《 The Thespians (and voice actors) of Scratch 》</a></div></div></div></div></div><button type="button" data-role="none" class="slick-arrow slick-next" style="display: block;"> Next</button></div></div></div></div><div class="inner mod-splash"><div class="box"><div class="box-header"><h4>Projects Curated by <a href="https://scratch.mit.edu/users/ChaiLatte2233" id="curator-link">ChaiLatte2233</a></h4><h5></h5><p><a href="/studios/386359/">Learn More</a></p></div><div class="box-content"><div class="slick-initialized slick-slider carousel"><div class="slick-list"><div class="slick-track" style="opacity: 1; transform: translate3d(0px, 0px, 0px); width: 1365px;"><div class="thumbnail project slick-slide slick-active"><a class="thumbnail-image" href="/projects/515747491/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/515747491.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/515747491/" title="Darker Nights ~ Ep. 1">Darker Nights ~ Ep. 1</a><div class="thumbnail-creator"><a href="/users/-TrueGryffindor89-/">-TrueGryffindor89-</a></div></div></div></div><div class="thumbnail project slick-slide slick-active"><a class="thumbnail-image" href="/projects/506508620/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/506508620.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/506508620/" title="Instrument Personality Quiz">Instrument Personality Quiz</a><div class="thumbnail-creator"><a href="/users/JoyfuII/">JoyfuII</a></div></div></div></div><div class="thumbnail project slick-slide slick-active"><a class="thumbnail-image" href="/projects/507907862/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/507907862.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/507907862/" title="Soon you'll get better - a cover by eve">Soon you'll get better - a cover by eve</a><div class="thumbnail-creator"><a href="/users/EvelyEve/">EvelyEve</a></div></div></div></div><div class="thumbnail project slick-slide slick-active"><a class="thumbnail-image" href="/projects/500914972/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/500914972.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/500914972/" title="experimentation">experimentation</a><div class="thumbnail-creator"><a href="/users/Clementine_Blue/">Clementine_Blue</a></div></div></div></div><div class="thumbnail project slick-slide"><a class="thumbnail-image" href="/projects/484430781/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/484430781.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/484430781/" title="Animal Cell // Diagram">Animal Cell // Diagram</a><div class="thumbnail-creator"><a href="/users/nightmxre-/">nightmxre-</a></div></div></div></div></div></div></div></div></div><div class="box"><div class="box-header"><h4>Scratch Design Studio - Colorless</h4><h5></h5><p><a href="/studios/29275132/">Visit the studio</a></p></div><div class="box-content"><div class="slick-initialized slick-slider carousel"><button type="button" data-role="none" class="slick-arrow slick-prev slick-disabled" style="display: block;"> Previous</button><div class="slick-list"><div class="slick-track" style="opacity: 1; transform: translate3d(0px, 0px, 0px); width: 2940px;"><div class="thumbnail project slick-slide slick-active"><a class="thumbnail-image" href="/projects/518580100/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/518580100.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/518580100/" title="Scrolling Platformer V1.1 remix">Scrolling Platformer V1.1 remix</a><div class="thumbnail-creator"><a href="/users/cs2860999/">cs2860999</a></div></div></div></div><div class="thumbnail project slick-slide slick-active"><a class="thumbnail-image" href="/projects/520446998/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/520446998.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/520446998/" title="BLACK AND WHITE - A Platformer">BLACK AND WHITE - A Platformer</a><div class="thumbnail-creator"><a href="/users/speedyslicer137/">speedyslicer137</a></div></div></div></div><div class="thumbnail project slick-slide slick-active"><a class="thumbnail-image" href="/projects/517381570/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/517381570.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/517381570/" title="Monochrome (A short film?)">Monochrome (A short film?)</a><div class="thumbnail-creator"><a href="/users/It7311/">It7311</a></div></div></div></div><div class="thumbnail project slick-slide slick-active"><a class="thumbnail-image" href="/projects/512892507/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/512892507.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/512892507/" title="Earth without water">Earth without water</a><div class="thumbnail-creator"><a href="/users/eevee627/">eevee627</a></div></div></div></div><div class="thumbnail project slick-slide"><a class="thumbnail-image" href="/projects/514148622/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/514148622.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/514148622/" title="My Colorless Drawings">My Colorless Drawings</a><div class="thumbnail-creator"><a href="/users/Coding5101520/">Coding5101520</a></div></div></div></div><div data-index="5" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="6" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="7" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="8" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="9" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="10" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="11" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="12" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="13" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="14" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="15" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="16" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="17" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="18" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="19" class="slick-slide" tabindex="-1" style="outline: none;"></div></div></div><button type="button" data-role="none" class="slick-arrow slick-next" style="display: block;"> Next</button></div></div></div><div class="box"><div class="box-header"><h4>Projects Loved by Scratchers I'm Following</h4><h5></h5><p><a></a></p></div><div class="box-content"><div class="slick-initialized slick-slider carousel"><button type="button" data-role="none" class="slick-arrow slick-prev slick-disabled" style="display: block;"> Previous</button><div class="slick-list"><div class="slick-track" style="opacity: 1; transform: translate3d(0px, 0px, 0px); width: 2940px;"><div class="thumbnail project slick-slide slick-active"><a class="thumbnail-image" href="/projects/139457120/"><img alt="" src="https://cdn2.scratch.mit.edu/get_image/project/139457120_480x360.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/139457120/" title="Icon Mosaic Art!　アイコンモザイクアート!">Icon Mosaic Art!　アイコンモザイクアート!</a><div class="thumbnail-creator"><a href="/users/yukku/">yukku</a></div></div></div></div><div class="thumbnail project slick-slide slick-active"><a class="thumbnail-image" href="/projects/489134424/"><img alt="" src="https://cdn2.scratch.mit.edu/get_image/project/489134424_480x360.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/489134424/" title="Draw your Dream">Draw your Dream</a><div class="thumbnail-creator"><a href="/users/LeoScratchStuff/">LeoScratchStuff</a></div></div></div></div><div class="thumbnail project slick-slide slick-active"><a class="thumbnail-image" href="/projects/500896909/"><img alt="" src="https://cdn2.scratch.mit.edu/get_image/project/500896909_480x360.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/500896909/" title="Scratch And Its Current Rise Of Inappropriate Language">Scratch And Its Current Rise Of Inappropriate Language</a><div class="thumbnail-creator"><a href="/users/StickmantheStickman/">StickmantheStickman</a></div></div></div></div><div class="thumbnail project slick-slide slick-active"><a class="thumbnail-image" href="/projects/502679407/"><img alt="" src="https://cdn2.scratch.mit.edu/get_image/project/502679407_480x360.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/502679407/" title="Homework || #animations #stories #music #art">Homework || #animations #stories #music #art</a><div class="thumbnail-creator"><a href="/users/LawsOfScienceChanger/">LawsOfScienceChanger</a></div></div></div></div><div class="thumbnail project slick-slide"><a class="thumbnail-image" href="/projects/508871852/"><img alt="" src="https://cdn2.scratch.mit.edu/get_image/project/508871852_480x360.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/508871852/" title="Sun">Sun</a><div class="thumbnail-creator"><a href="/users/Bubbles_Official/">Bubbles_Official</a></div></div></div></div><div data-index="5" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="6" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="7" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="8" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="9" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="10" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="11" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="12" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="13" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="14" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="15" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="16" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="17" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="18" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="19" class="slick-slide" tabindex="-1" style="outline: none;"></div></div></div><button type="button" data-role="none" class="slick-arrow slick-next" style="display: block;"> Next</button></div></div></div><div class="box"><div class="box-header"><h4>What the Community is Remixing</h4><h5></h5><p><a></a></p></div><div class="box-content"><div class="slick-initialized slick-slider carousel"><button type="button" data-role="none" class="slick-arrow slick-prev slick-disabled" style="display: block;"> Previous</button><div class="slick-list"><div class="slick-track" style="opacity: 1; transform: translate3d(0px, 0px, 0px); width: 2940px;"><div class="thumbnail project slick-slide slick-active"><a class="thumbnail-image" href="/projects/510944862/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/510944862.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/510944862/" title="Scratch's Elites - Trailer + Sign Ups [ CLOSED ]">Scratch's Elites - Trailer + Sign Ups [ CLOSED ]</a><div class="thumbnail-creator"><a href="/users/Walle10-0/">Walle10-0</a></div></div></div><div class="thumbnail-remixes" title="86 remixes">86</div></div><div class="thumbnail project slick-slide slick-active"><a class="thumbnail-image" href="/projects/356595737/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/356595737.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/356595737/" title="Geometry Dash Cadenza">Geometry Dash Cadenza</a><div class="thumbnail-creator"><a href="/users/iPhone_ATT_TWC115/">iPhone_ATT_TWC115</a></div></div></div><div class="thumbnail-remixes" title="78 remixes">78</div></div><div class="thumbnail project slick-slide slick-active"><a class="thumbnail-image" href="/projects/508432699/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/508432699.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/508432699/" title="Rage Story || #animations #stories #music #art">Rage Story || #animations #stories #music #art</a><div class="thumbnail-creator"><a href="/users/LawsOfScienceChanger/">LawsOfScienceChanger</a></div></div></div><div class="thumbnail-remixes" title="119 remixes">119</div></div><div class="thumbnail project slick-slide slick-active"><a class="thumbnail-image" href="/projects/508860540/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/508860540.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/508860540/" title="Pizzeria">Pizzeria</a><div class="thumbnail-creator"><a href="/users/xSyx/">xSyx</a></div></div></div><div class="thumbnail-remixes" title="46 remixes">46</div></div><div class="thumbnail project slick-slide"><a class="thumbnail-image" href="/projects/510191754/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/510191754.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/510191754/" title="Magic Tiles | Update with Axel F">Magic Tiles | Update with Axel F</a><div class="thumbnail-creator"><a href="/users/O2009H/">O2009H</a></div></div></div><div class="thumbnail-remixes" title="73 remixes">73</div></div><div data-index="5" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="6" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="7" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="8" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="9" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="10" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="11" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="12" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="13" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="14" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="15" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="16" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="17" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="18" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="19" class="slick-slide" tabindex="-1" style="outline: none;"></div></div></div><button type="button" data-role="none" class="slick-arrow slick-next" style="display: block;"> Next</button></div></div></div><div class="box"><div class="box-header"><h4>What the Community is Loving</h4><h5></h5><p><a></a></p></div><div class="box-content"><div class="slick-initialized slick-slider carousel"><button type="button" data-role="none" class="slick-arrow slick-prev slick-disabled" style="display: block;"> Previous</button><div class="slick-list"><div class="slick-track" style="opacity: 1; transform: translate3d(0px, 0px, 0px); width: 2940px;"><div class="thumbnail project slick-slide slick-active"><a class="thumbnail-image" href="/projects/513105687/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/513105687.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/513105687/" title="BLANK WORLD 2: Moonlit Night         #All #Games">BLANK WORLD 2: Moonlit Night         #All #Games</a><div class="thumbnail-creator"><a href="/users/FreeFalling-Studios/">FreeFalling-Studios</a></div></div></div><div class="thumbnail-loves" title="1005 loves">1005</div></div><div class="thumbnail project slick-slide slick-active"><a class="thumbnail-image" href="/projects/518030896/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/518030896.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/518030896/" title="Bookmarks. || animation + 4k special!">Bookmarks. || animation + 4k special!</a><div class="thumbnail-creator"><a href="/users/lisabc/">lisabc</a></div></div></div><div class="thumbnail-loves" title="2138 loves">2138</div></div><div class="thumbnail project slick-slide slick-active"><a class="thumbnail-image" href="/projects/509651370/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/509651370.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/509651370/" title="⟳ Redrawing Scratch Sprites ˊˎ-">⟳ Redrawing Scratch Sprites ˊˎ-</a><div class="thumbnail-creator"><a href="/users/DreamiiSky/">DreamiiSky</a></div></div></div><div class="thumbnail-loves" title="601 loves">601</div></div><div class="thumbnail project slick-slide slick-active"><a class="thumbnail-image" href="/projects/497574187/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/497574187.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/497574187/" title="10k Q&amp;A ANSWERS">10k Q&amp;A ANSWERS</a><div class="thumbnail-creator"><a href="/users/-PhantomAnimations-/">-PhantomAnimations-</a></div></div></div><div class="thumbnail-loves" title="827 loves">827</div></div><div class="thumbnail project slick-slide"><a class="thumbnail-image" href="/projects/487729829/"><img alt="" src="//uploads.scratch.mit.edu/projects/thumbnails/487729829.png"></a><div class="thumbnail-info"><div class="thumbnail-title"><a href="/projects/487729829/" title="Trapped | A 100% Pen Scrolling Platformer">Trapped | A 100% Pen Scrolling Platformer</a><div class="thumbnail-creator"><a href="/users/C369J/">C369J</a></div></div></div><div class="thumbnail-loves" title="1417 loves">1417</div></div><div data-index="5" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="6" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="7" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="8" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="9" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="10" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="11" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="12" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="13" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="14" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="15" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="16" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="17" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="18" class="slick-slide" tabindex="-1" style="outline: none;"></div><div data-index="19" class="slick-slide" tabindex="-1" style="outline: none;"></div></div></div><button type="button" data-role="none" class="slick-arrow slick-next" style="display: block;"> Next</button></div></div></div></div></div></div><div id="footer"><div class="inner"><div class="lists"><dl><dt><span>About</span></dt><dd><a href="/about"><span>About Scratch</span></a></dd><dd><a href="/parents/"><span>For Parents</span></a></dd><dd><a href="/educators"><span>For Educators</span></a></dd><dd><a href="/developers"><span>For Developers</span></a></dd><dd><a href="/credits"><span>Our Team</span></a></dd><dd><a href="https://scratchfoundation.org/supporters"><span>Donors</span></a></dd><dd><a href="https://www.scratchfoundation.org/opportunities"><span>Jobs</span></a></dd><dd><a href="https://secure.donationpay.org/scratchfoundation/"><span>Donate</span></a></dd></dl><dl><dt><span>Community</span></dt><dd><a href="/community_guidelines"><span>Community Guidelines</span></a></dd><dd><a href="/discuss/"><span>Discussion Forums</span></a></dd><dd><a href="https://en.scratch-wiki.info/"><span>Scratch Wiki</span></a></dd><dd><a href="/statistics/"><span>Statistics</span></a></dd></dl><dl><dt><span>Resources</span></dt><dd><a href="/ideas"><span>Ideas</span></a></dd><dd><a href="/info/faq"><span>FAQ</span></a></dd><dd><a href="/download"><span>Download</span></a></dd><dd><a href="/contact-us/"><span>Contact Us</span></a></dd></dl><dl><dt><span>Legal</span></dt><dd><a href="/terms_of_use"><span>Terms of Use</span></a></dd><dd><a href="/privacy_policy"><span>Privacy Policy</span></a></dd><dd><a href="/DMCA"><span>DMCA</span></a></dd></dl><dl><dt><span>Scratch Family</span></dt><dd><a href="http://scratched.gse.harvard.edu/"><span>ScratchEd</span></a></dd><dd><a href="https://www.scratchjr.org/"><span>ScratchJr</span></a></dd><dd><a href="http://day.scratch.mit.edu/">Scratch Day</a></dd><dd><a href="/conference"><span>Scratch Conference</span></a></dd><dd><a href="http://www.scratchfoundation.org/"><span>Scratch Foundation</span></a></dd><dd><a href="/store"><span>Scratch Store</span></a></dd></dl></div><form class="language-chooser" novalidate=""><div class="select"><div class="form-group row"><label class="control-label col-sm-3" data-required="true" for="frc-language-1088"><span class="required-symbol"> *</span></label><div class="col-sm-9"><select class="form-control" required="" name="language" id="frc-language-1088"><option value="ab">Аҧсшәа</option><option value="af">Afrikaans</option><option value="ar">العربية</option><option value="am">አማርኛ</option><option value="az">Azeri</option><option value="id">Bahasa Indonesia</option><option value="be">Беларуская</option><option value="bg">Български</option><option value="ca">Català</option><option value="cs">Česky</option><option value="cy">Cymraeg</option><option value="da">Dansk</option><option value="de">Deutsch</option><option value="et">Eesti</option><option value="el">Ελληνικά</option><option value="en">English</option><option value="es">Español</option><option value="es-419">Español Latinoamericano</option><option value="eu">Euskara</option><option value="fa">فارسی</option><option value="fr">Français</option><option value="ga">Gaeilge</option><option value="gd">Gàidhlig</option><option value="gl">Galego</option><option value="ko">한국어</option><option value="hy">Հայերեն</option><option value="he">עִבְרִית</option><option value="hr">Hrvatski</option><option value="xh">isiXhosa</option><option value="zu">isiZulu</option><option value="is">Íslenska</option><option value="it">Italiano</option><option value="ka">ქართული ენა</option><option value="qu">Kichwa</option><option value="sw">Kiswahili</option><option value="ht">Kreyòl ayisyen</option><option value="ku">Kurdî</option><option value="ckb">کوردیی ناوەندی</option><option value="lv">Latviešu</option><option value="lt">Lietuvių</option><option value="hu">Magyar</option><option value="mi">Māori</option><option value="mn">Монгол хэл</option><option value="nl">Nederlands</option><option value="ja">日本語</option><option value="ja-Hira">にほんご</option><option value="nb">Norsk Bokmål</option><option value="nn">Norsk Nynorsk</option><option value="or">ଓଡ଼ିଆ</option><option value="uz">Oʻzbekcha</option><option value="th">ไทย</option><option value="km">ភាសាខ្មែរ</option><option value="pl">Polski</option><option value="pt">Português</option><option value="pt-br">Português Brasileiro</option><option value="rap">Rapa Nui</option><option value="ro">Română</option><option value="ru">Русский</option><option value="nso">Sepedi</option><option value="tn">Setswana</option><option value="sk">Slovenčina</option><option value="sl">Slovenščina</option><option value="sr">Српски</option><option value="fi">Suomi</option><option value="sv">Svenska</option><option value="vi">Tiếng Việt</option><option value="tr">Türkçe</option><option value="uk">Українська</option><option value="zh-cn">简体中文</option><option value="zh-tw">繁體中文</option></select></div></div></div></form></div></div><div id="donor"><div id="donor-text"><div><span>Scratch is available for free thanks to support from our <a href="https://www.scratchfoundation.org/supporters"><span>donors</span></a>. We are grateful to our Founding Partners:</span></div><div><span>Massachusetts Institute of Technology, National Science Foundation, Siegel Family Endowment, and LEGO Foundation.</span></div></div></div></div></div>

        <!-- Vendor & Initialize (Session & Localization)-->
        <script src="/js/common.bundle.js"></script>

        <!-- Scripts -->
        <script src="/js/splash.intl.js"></script>
        <script src="/js/splash.bundle.js"></script><div class="ReactModalPortal"></div>

        <!-- Translate title element -->
        
            <script>
                var loc = window._locale || 'en';
                if (typeof window._messages !== 'undefined' && loc !== 'en') {
                    if (typeof window._messages[loc] === 'undefined') {
                        loc = loc.split('-')[0];
                    }
                    if (typeof window._messages[loc] !== 'undefined') {
                        var localizedTitle = window._messages[loc]['general.' + 'Imagine, Program, Share'.toLowerCase()] || '';
                        if (localizedTitle.length > 0) {
                            document.title = 'Scratch - ' + localizedTitle;
                        }
                    }
                }
            </script>
        
    

</body></html>
