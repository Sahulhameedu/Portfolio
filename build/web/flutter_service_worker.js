'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {"assets/AssetManifest.bin": "dbdf5de0f678d24583ab03695b90f2bd",
"assets/AssetManifest.bin.json": "7204d587a90b0f1dd8a0662e8f75f956",
"assets/AssetManifest.json": "d96dea780bcb77264ed7418e9ac92c04",
"assets/assets/cv/Sahulhameed_Resume.pdf": "e0894b0330816957c2e7de7392b9df49",
"assets/assets/fonts/Handlee-Regular.ttf": "fc5912e756e2601bf78d37a4907dd832",
"assets/assets/fonts/Inter-Bold.ttf": "f77ce9588dccbc52fdbf0b79f0d63714",
"assets/assets/fonts/Inter-Regular.ttf": "37dcabff629c3690303739be2e0b3524",
"assets/assets/icons/android-studio.svg": "0c033d7b5ef36fd18a00b441195b7f55",
"assets/assets/icons/arrow.svg": "9ddec36ec65ab5e02d1c56265ae32759",
"assets/assets/icons/css.svg": "c333b2aeeb71a5f4e7830dc6f2c6f79a",
"assets/assets/icons/dart.svg": "eff9c1b129aa2b382d3be33b24a31561",
"assets/assets/icons/flutter.svg": "63a2d44ed4f75346743ad8b7f87805c3",
"assets/assets/icons/git.svg": "a0312f13f27536fe233dcfc81e7f9a63",
"assets/assets/icons/github.png": "ae6543a3e23e34c4cb141f01aef31d9e",
"assets/assets/icons/github.svg": "cf592650182ecfeb463d1719f71b056a",
"assets/assets/icons/html.svg": "b53d964427fb265caf717f2febdfc396",
"assets/assets/icons/javascript.svg": "5205ffc8feaa6824c2b53e4f16420a6c",
"assets/assets/icons/linkedin.png": "d96c149bb3e7c14797ff1bf03406a223",
"assets/assets/icons/logo.svg": "c4ab68cad2838d638c1f1580acb98bc7",
"assets/assets/icons/mongodb.svg": "01dda3f421ecf7401d5c2c0b254faf02",
"assets/assets/icons/nodejs.svg": "d14a4c1e89414fbbbbe94035b517b312",
"assets/assets/icons/react.svg": "bd34a6e77d2fb2cc88e5fdc8dad3e64b",
"assets/assets/icons/vs-code.svg": "24087b6298d51f4441174be43daac39a",
"assets/assets/images/donation.jpeg": "308c58789ff610ace9d33498cdb212a8",
"assets/assets/images/flutter.png": "a5bf1d8c59641c67fee7e0eaf80b7d83",
"assets/assets/images/geofence.jpeg": "9175e23e639f71babc9d2d806eb2ee8a",
"assets/assets/images/kinder.png": "748b8baf3122a402896c7624efebb120",
"assets/assets/images/nodejs.png": "cd4931f94e18d4d80b1477a21f44bebc",
"assets/assets/images/profile.svg": "0fc866d0ad4670369cebffc735529dfa",
"assets/assets/images/profile_pic.jpg": "0cb762bef74d334693a700f39c65e823",
"assets/assets/images/reactjs.png": "e52b88ea6d44e19f04241bf7ca4eeae1",
"assets/assets/images/rfid.jpg": "37742c603509a13622b61d13aca5a7ea",
"assets/assets/images/splash%2520screen.jpeg": "eb27dd934262f7d44a6564f49d737971",
"assets/FontManifest.json": "1b64af7cd273b683990dcfc3f33ae167",
"assets/fonts/MaterialIcons-Regular.otf": "afaffac8e55bab77652f1514a6c9d50d",
"assets/NOTICES": "3cdbebb77bfd18b9b4ff472c44330255",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/packages/iconsax_flutter/fonts/FlutterIconsax.ttf": "6ebc7bc5b74956596611c6774d8beb5b",
"assets/packages/lucide_icons/assets/lucide.ttf": "03f254a55085ec6fe9a7ae1861fda9fd",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "728b2d477d9b8c14593d4f9b82b484f3",
"canvaskit/canvaskit.js.symbols": "bdcd3835edf8586b6d6edfce8749fb77",
"canvaskit/canvaskit.wasm": "7a3f4ae7d65fc1de6a6e7ddd3224bc93",
"canvaskit/chromium/canvaskit.js": "8191e843020c832c9cf8852a4b909d4c",
"canvaskit/chromium/canvaskit.js.symbols": "b61b5f4673c9698029fa0a746a9ad581",
"canvaskit/chromium/canvaskit.wasm": "f504de372e31c8031018a9ec0a9ef5f0",
"canvaskit/skwasm.js": "ea559890a088fe28b4ddf70e17e60052",
"canvaskit/skwasm.js.symbols": "e72c79950c8a8483d826a7f0560573a1",
"canvaskit/skwasm.wasm": "39dd80367a4e71582d234948adc521c0",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "83d881c1dbb6d6bcd6b42e274605b69c",
"flutter_bootstrap.js": "c953e63c52b04d4371457abf9eabeeec",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "b3a089ab9fe29e08ea852386308c661d",
"/": "b3a089ab9fe29e08ea852386308c661d",
"main.dart.js": "65c61ff668dfc96ffba6527ce8bda381",
"manifest.json": "e74af8957b5899dc6da961caee768ec9",
"version.json": "009c9e65172e010890f7f65fde438006"};
// The application shell files that are downloaded before a service worker can
// start.
const CORE = ["main.dart.js",
"index.html",
"flutter_bootstrap.js",
"assets/AssetManifest.bin.json",
"assets/FontManifest.json"];

// During install, the TEMP cache is populated with the application shell files.
self.addEventListener("install", (event) => {
  self.skipWaiting();
  return event.waitUntil(
    caches.open(TEMP).then((cache) => {
      return cache.addAll(
        CORE.map((value) => new Request(value, {'cache': 'reload'})));
    })
  );
});
// During activate, the cache is populated with the temp files downloaded in
// install. If this service worker is upgrading from one with a saved
// MANIFEST, then use this to retain unchanged resource files.
self.addEventListener("activate", function(event) {
  return event.waitUntil(async function() {
    try {
      var contentCache = await caches.open(CACHE_NAME);
      var tempCache = await caches.open(TEMP);
      var manifestCache = await caches.open(MANIFEST);
      var manifest = await manifestCache.match('manifest');
      // When there is no prior manifest, clear the entire cache.
      if (!manifest) {
        await caches.delete(CACHE_NAME);
        contentCache = await caches.open(CACHE_NAME);
        for (var request of await tempCache.keys()) {
          var response = await tempCache.match(request);
          await contentCache.put(request, response);
        }
        await caches.delete(TEMP);
        // Save the manifest to make future upgrades efficient.
        await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
        // Claim client to enable caching on first launch
        self.clients.claim();
        return;
      }
      var oldManifest = await manifest.json();
      var origin = self.location.origin;
      for (var request of await contentCache.keys()) {
        var key = request.url.substring(origin.length + 1);
        if (key == "") {
          key = "/";
        }
        // If a resource from the old manifest is not in the new cache, or if
        // the MD5 sum has changed, delete it. Otherwise the resource is left
        // in the cache and can be reused by the new service worker.
        if (!RESOURCES[key] || RESOURCES[key] != oldManifest[key]) {
          await contentCache.delete(request);
        }
      }
      // Populate the cache with the app shell TEMP files, potentially overwriting
      // cache files preserved above.
      for (var request of await tempCache.keys()) {
        var response = await tempCache.match(request);
        await contentCache.put(request, response);
      }
      await caches.delete(TEMP);
      // Save the manifest to make future upgrades efficient.
      await manifestCache.put('manifest', new Response(JSON.stringify(RESOURCES)));
      // Claim client to enable caching on first launch
      self.clients.claim();
      return;
    } catch (err) {
      // On an unhandled exception the state of the cache cannot be guaranteed.
      console.error('Failed to upgrade service worker: ' + err);
      await caches.delete(CACHE_NAME);
      await caches.delete(TEMP);
      await caches.delete(MANIFEST);
    }
  }());
});
// The fetch handler redirects requests for RESOURCE files to the service
// worker cache.
self.addEventListener("fetch", (event) => {
  if (event.request.method !== 'GET') {
    return;
  }
  var origin = self.location.origin;
  var key = event.request.url.substring(origin.length + 1);
  // Redirect URLs to the index.html
  if (key.indexOf('?v=') != -1) {
    key = key.split('?v=')[0];
  }
  if (event.request.url == origin || event.request.url.startsWith(origin + '/#') || key == '') {
    key = '/';
  }
  // If the URL is not the RESOURCE list then return to signal that the
  // browser should take over.
  if (!RESOURCES[key]) {
    return;
  }
  // If the URL is the index.html, perform an online-first request.
  if (key == '/') {
    return onlineFirst(event);
  }
  event.respondWith(caches.open(CACHE_NAME)
    .then((cache) =>  {
      return cache.match(event.request).then((response) => {
        // Either respond with the cached resource, or perform a fetch and
        // lazily populate the cache only if the resource was successfully fetched.
        return response || fetch(event.request).then((response) => {
          if (response && Boolean(response.ok)) {
            cache.put(event.request, response.clone());
          }
          return response;
        });
      })
    })
  );
});
self.addEventListener('message', (event) => {
  // SkipWaiting can be used to immediately activate a waiting service worker.
  // This will also require a page refresh triggered by the main worker.
  if (event.data === 'skipWaiting') {
    self.skipWaiting();
    return;
  }
  if (event.data === 'downloadOffline') {
    downloadOffline();
    return;
  }
});
// Download offline will check the RESOURCES for all files not in the cache
// and populate them.
async function downloadOffline() {
  var resources = [];
  var contentCache = await caches.open(CACHE_NAME);
  var currentContent = {};
  for (var request of await contentCache.keys()) {
    var key = request.url.substring(origin.length + 1);
    if (key == "") {
      key = "/";
    }
    currentContent[key] = true;
  }
  for (var resourceKey of Object.keys(RESOURCES)) {
    if (!currentContent[resourceKey]) {
      resources.push(resourceKey);
    }
  }
  return contentCache.addAll(resources);
}
// Attempt to download the resource online before falling back to
// the offline cache.
function onlineFirst(event) {
  return event.respondWith(
    fetch(event.request).then((response) => {
      return caches.open(CACHE_NAME).then((cache) => {
        cache.put(event.request, response.clone());
        return response;
      });
    }).catch((error) => {
      return caches.open(CACHE_NAME).then((cache) => {
        return cache.match(event.request).then((response) => {
          if (response != null) {
            return response;
          }
          throw error;
        });
      });
    })
  );
}
