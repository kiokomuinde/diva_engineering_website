'use strict';
const MANIFEST = 'flutter-app-manifest';
const TEMP = 'flutter-temp-cache';
const CACHE_NAME = 'flutter-app-cache';

const RESOURCES = {".git/COMMIT_EDITMSG": "99558ef831f616e5f8049d51ce81e3e4",
".git/config": "94779b0fa5b1336e129f57dd76525629",
".git/description": "a0a7c3fff21f2aea3cfa1d0316dd816c",
".git/HEAD": "4cf2d64e44205fe628ddd534e1151b58",
".git/hooks/applypatch-msg.sample": "ce562e08d8098926a3862fc6e7905199",
".git/hooks/commit-msg.sample": "579a3c1e12a1e74a98169175fb913012",
".git/hooks/fsmonitor-watchman.sample": "a0b2633a2c8e97501610bd3f73da66fc",
".git/hooks/post-update.sample": "2b7ea5cee3c49ff53d41e00785eb974c",
".git/hooks/pre-applypatch.sample": "054f9ffb8bfe04a599751cc757226dda",
".git/hooks/pre-commit.sample": "5029bfab85b1c39281aa9697379ea444",
".git/hooks/pre-merge-commit.sample": "39cb268e2a85d436b9eb6f47614c3cbc",
".git/hooks/pre-push.sample": "2c642152299a94e05ea26eae11993b13",
".git/hooks/pre-rebase.sample": "56e45f2bcbc8226d2b4200f7c46371bf",
".git/hooks/pre-receive.sample": "2ad18ec82c20af7b5926ed9cea6aeedd",
".git/hooks/prepare-commit-msg.sample": "2b5c047bdb474555e1787db32b2d2fc5",
".git/hooks/push-to-checkout.sample": "c7ab00c7784efeadad3ae9b228d4b4db",
".git/hooks/sendemail-validate.sample": "4d67df3a8d5c98cb8565c07e42be0b04",
".git/hooks/update.sample": "647ae13c682f7827c22f5fc08a03674e",
".git/index": "5dacbd0006dada7d1ac19ec81af3cb03",
".git/info/exclude": "036208b4a1ab4a235d75c181e685e5a3",
".git/logs/HEAD": "0557e55d749a515153d706564752b6a9",
".git/logs/refs/heads/master": "0557e55d749a515153d706564752b6a9",
".git/logs/refs/remotes/origin/gh-pages": "afd03201f69c997b451ea158e5e5f119",
".git/objects/02/1d4f3579879a4ac147edbbd8ac2d91e2bc7323": "9e9721befbee4797263ad5370cd904ff",
".git/objects/03/51560f3dd9953321177ffd7bc79b6c0bc73ab6": "5d9c203f5543e7dada45675a9052d133",
".git/objects/07/2cb08999eaf9054e7c51d097012faa6da9ea5d": "e0fca60aa7410c993922f16f559af1b4",
".git/objects/0f/616aadda5de59aca339472473ded9329ffe8e4": "022c0134248adbbf3008b1a984fa0886",
".git/objects/1e/56712588fe3191bc6c1223acc6e0429944aa1d": "db397f74f7ded8a2f40b9c71dc82f0f9",
".git/objects/20/3a3ff5cc524ede7e585dff54454bd63a1b0f36": "4b23a88a964550066839c18c1b5c461e",
".git/objects/22/bbc652d3481f4df738730c007778039c7a2026": "f08c41f65fcba5315a977a861760f62f",
".git/objects/29/f22f56f0c9903bf90b2a78ef505b36d89a9725": "e85914d97d264694217ae7558d414e81",
".git/objects/2a/6f8e85dba5d1b292c64b822fea3e4de16dd30c": "c12564b6c33cb3f9ca22845b50e58924",
".git/objects/33/256d04cfdd318ccb5706dc832e4227fd745b0d": "4451cf11bd2c6f70575c066b246501fe",
".git/objects/39/7acce501035a717554b2a4b2fc8f07f9e6e016": "77990c87f632fda461e0cf48721c8772",
".git/objects/44/fd598f89a3acef81e39b4b54a0ecc20ca1d9aa": "7fbe97ca3e80dd9cfa0a8f29d0058222",
".git/objects/46/4ab5882a2234c39b1a4dbad5feba0954478155": "2e52a767dc04391de7b4d0beb32e7fc4",
".git/objects/4d/bf9da7bcce5387354fe394985b98ebae39df43": "534c022f4a0845274cbd61ff6c9c9c33",
".git/objects/4f/fbe6ec4693664cb4ff395edf3d949bd4607391": "2beb9ca6c799e0ff64e0ad79f9e55e69",
".git/objects/50/dcdd5bf174b8471336dc084acbdea26542c8a3": "a1bd9b87e9386c1d7a978663ecb137d9",
".git/objects/58/973e147fca3ab6b2d5d773651d77688348935f": "56860c98fae017a8c29d5df2ea4d1fb7",
".git/objects/6b/9862a1351012dc0f337c9ee5067ed3dbfbb439": "85896cd5fba127825eb58df13dfac82b",
".git/objects/7a/6c1911dddaea52e2dbffc15e45e428ec9a9915": "f1dee6885dc6f71f357a8e825bda0286",
".git/objects/7c/b1dc62a6c7a24129ee94f6b6b4bbb568bf4875": "b3840be6137ee8e222ad2726b98cca98",
".git/objects/88/cfd48dff1169879ba46840804b412fe02fefd6": "e42aaae6a4cbfbc9f6326f1fa9e3380c",
".git/objects/8a/aa46ac1ae21512746f852a42ba87e4165dfdd1": "1d8820d345e38b30de033aa4b5a23e7b",
".git/objects/8e/2983f18424d25c830cbe9abe0916bdd8cf6a3d": "a7d13c9534f5469f09121251e7a6045a",
".git/objects/98/0d49437042d93ffa850a60d02cef584a35a85c": "8e18e4c1b6c83800103ff097cc222444",
".git/objects/9b/3ef5f169177a64f91eafe11e52b58c60db3df2": "91d370e4f73d42e0a622f3e44af9e7b1",
".git/objects/9d/cd61087bd1a98a2a8c978f83b0808e9b34d8c8": "c11b7d2257d062a84aa0622883944347",
".git/objects/9e/3b4630b3b8461ff43c272714e00bb47942263e": "accf36d08c0545fa02199021e5902d52",
".git/objects/a6/e42deb42460b064a9a1f549dcd46a8299fb130": "09d521cecc503675fb74bc04b4437409",
".git/objects/a7/ed9e650d1fe074f45aa4ee8211aa1cd2a3b5b5": "cb975d7e2ae6284ced74cbf6c5a1381d",
".git/objects/b6/94415528efc9236b7c6a176633a7cc04c08405": "3a0db984aca2ed8743bcd62f8510cfec",
".git/objects/b6/b8806f5f9d33389d53c2868e6ea1aca7445229": "b14016efdbcda10804235f3a45562bbf",
".git/objects/b7/49bfef07473333cf1dd31e9eed89862a5d52aa": "36b4020dca303986cad10924774fb5dc",
".git/objects/b9/2a0d854da9a8f73216c4a0ef07a0f0a44e4373": "f62d1eb7f51165e2a6d2ef1921f976f3",
".git/objects/bd/fd0d7c31c0c87087a3fc553ad7c7ec881a6b3a": "49b9f08717f612c7dac083c2c9215847",
".git/objects/c4/016f7d68c0d70816a0c784867168ffa8f419e1": "fdf8b8a8484741e7a3a558ed9d22f21d",
".git/objects/ca/3bba02c77c467ef18cffe2d4c857e003ad6d5d": "316e3d817e75cf7b1fd9b0226c088a43",
".git/objects/d3/bc217d97fa0147ae149f91445fae299701ace6": "6f4f7b7e48a7873b77c0e851b27c2b74",
".git/objects/d4/3532a2348cc9c26053ddb5802f0e5d4b8abc05": "3dad9b209346b1723bb2cc68e7e42a44",
".git/objects/d6/9c56691fbdb0b7efa65097c7cc1edac12a6d3e": "868ce37a3a78b0606713733248a2f579",
".git/objects/d6/ac6684bc4be4a89cbb7b5e58ed2f2bbccb76b1": "bcb038fefbb40d189b96bd9d94ae0a98",
".git/objects/d7/7cfefdbe249b8bf90ce8244ed8fc1732fe8f73": "9c0876641083076714600718b0dab097",
".git/objects/dd/ab2346856960007abeda3ea94373bf9566da4c": "2513b8eea198477d10f2ad1ad8f9f553",
".git/objects/e2/778acdf9ec647727bb1e8af006dbeed7a2feef": "d649f6e621fab6996e28fa1261c58324",
".git/objects/e3/e9ee754c75ae07cc3d19f9b8c1e656cc4946a1": "14066365125dcce5aec8eb1454f0d127",
".git/objects/e4/2667b7335efc4c148866a09ab2f609996f6589": "b1fb51ef7ed6026a1618dd1426092ab6",
".git/objects/e6/93cb500251a66d4026ecf246ed4ddd1bdaf41d": "96b193620e61e7f1aaf8460d0b4005d3",
".git/objects/e9/94225c71c957162e2dcc06abe8295e482f93a2": "2eed33506ed70a5848a0b06f5b754f2c",
".git/objects/eb/9b4d76e525556d5d89141648c724331630325d": "37c0954235cbe27c4d93e74fe9a578ef",
".git/objects/ed/b55d4deb8363b6afa65df71d1f9fd8c7787f22": "886ebb77561ff26a755e09883903891d",
".git/objects/f2/04823a42f2d890f945f70d88b8e2d921c6ae26": "6b47f314ffc35cf6a1ced3208ecc857d",
".git/objects/f5/72b90ef57ee79b82dd846c6871359a7cb10404": "e68f5265f0bb82d792ff536dcb99d803",
".git/objects/f5/97be395b88afcdadf322d9d91e30a635feb248": "7b93151650b2de36bf7bad4bbd03839e",
".git/objects/f6/daf815b3a2f2c08df98d0d4855e92d8bef38b0": "43a0a27dd669863d7a52ac8dbe2dda31",
".git/objects/f9/23f828bb661dbac74c4e769827ceed91cdbdf0": "a1b931350ae8eb3867051ebf116583c6",
".git/objects/fa/8fc29fc33249fa025551fe7b4c7392a7aa56ad": "e038f6b629ac389d6372ae201740a9e1",
".git/objects/fe/3b987e61ed346808d9aa023ce3073530ad7426": "dc7db10bf25046b27091222383ede515",
".git/objects/ff/2159b77370d23bdfdcca5f436610778def95c7": "f67c26bbb744693e751d910ae17b38a6",
".git/refs/heads/master": "4cfbada7a0b7381167cbbaa41bca58b5",
".git/refs/remotes/origin/gh-pages": "4cfbada7a0b7381167cbbaa41bca58b5",
"assets/AssetManifest.bin": "8e5041d97e9d8285ddc9ec9f0b61b064",
"assets/AssetManifest.bin.json": "881b6a83a7ad405ea1e83dc541e3287f",
"assets/AssetManifest.json": "4cc6ce19c5d2bc5d4b6147e8aab8b25f",
"assets/assets/images/about_us_image.webp": "918c3f86ab2e9c62df6817ac1c1548b6",
"assets/assets/images/contact_map.webp": "c8e68af45a5448f6af5324fa54e38f55",
"assets/assets/images/hero_bg.webp": "900c05c2f7fb7043d86e87e431a69ba0",
"assets/assets/images/logo.webp": "2e96efe7654f02207ba3adb96756fd4e",
"assets/assets/images/logo_cisco.webp": "c78c61853f4b3c763274bd0245ae0d92",
"assets/assets/images/logo_dell.webp": "92b15e847c898c14c6cf794cceccf9fd",
"assets/assets/images/logo_hikvision.webp": "11cebd97a37d6dab5bb4941e42fef84c",
"assets/assets/images/logo_hp.webp": "0c017a761d0428a09497406804ffdb30",
"assets/assets/images/logo_microsoft.webp": "6725d8f0f94c37f05a0b8ff4e9800a7c",
"assets/assets/images/logo_vmware.webp": "1077048fd58f4d751314e87aa0d61954",
"assets/FontManifest.json": "dc3d03800ccca4601324923c0b1d6d57",
"assets/fonts/MaterialIcons-Regular.otf": "a82a5c7affe8cc7393eb370b0b70df39",
"assets/NOTICES": "4fddec2803b9208c5363bbed2dec0961",
"assets/packages/cupertino_icons/assets/CupertinoIcons.ttf": "33b7d9392238c04c131b6ce224e13711",
"assets/shaders/ink_sparkle.frag": "ecc85a2e95f5e9f53123dcaf8cb9b6ce",
"canvaskit/canvaskit.js": "140ccb7d34d0a55065fbd422b843add6",
"canvaskit/canvaskit.js.symbols": "58832fbed59e00d2190aa295c4d70360",
"canvaskit/canvaskit.wasm": "07b9f5853202304d3b0749d9306573cc",
"canvaskit/chromium/canvaskit.js": "5e27aae346eee469027c80af0751d53d",
"canvaskit/chromium/canvaskit.js.symbols": "193deaca1a1424049326d4a91ad1d88d",
"canvaskit/chromium/canvaskit.wasm": "24c77e750a7fa6d474198905249ff506",
"canvaskit/skwasm.js": "1ef3ea3a0fec4569e5d531da25f34095",
"canvaskit/skwasm.js.symbols": "0088242d10d7e7d6d2649d1fe1bda7c1",
"canvaskit/skwasm.wasm": "264db41426307cfc7fa44b95a7772109",
"canvaskit/skwasm_heavy.js": "413f5b2b2d9345f37de148e2544f584f",
"canvaskit/skwasm_heavy.js.symbols": "3c01ec03b5de6d62c34e17014d1decd3",
"canvaskit/skwasm_heavy.wasm": "8034ad26ba2485dab2fd49bdd786837b",
"CNAME": "e1387523602c19a789f63aef496c64ed",
"favicon.png": "5dcef449791fa27946b3d35ad8803796",
"flutter.js": "888483df48293866f9f41d3d9274a779",
"flutter_bootstrap.js": "58bf8b9ae2195d65bd3f736e387a7c2c",
"icons/Icon-192.png": "ac9a721a12bbc803b44f645561ecb1e1",
"icons/Icon-512.png": "96e752610906ba2a93c65f8abe1645f1",
"icons/Icon-maskable-192.png": "c457ef57daa1d16f64b27b786ec2ea3c",
"icons/Icon-maskable-512.png": "301a7604d45b3e739efc881eb04896ea",
"index.html": "93f8ce9f9209ef262da35367a058df47",
"/": "93f8ce9f9209ef262da35367a058df47",
"main.dart.js": "6593e3258a80ce061a9705b8a5023d06",
"manifest.json": "f8fa286459fa6bd881e5570799c735bd",
"version.json": "452d00915d7dcef169db4537ebf2901f"};
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
