import http from "node:http";
import { pathToFileURL } from "node:url";

const port = Number.parseInt(process.env.APP_PORT || "8080", 10);
const appName = process.env.APP_NAME || "personal-devops-env";
const appEnv = process.env.APP_ENV || "local";

export function createServer() {
  return http.createServer((request, response) => {
    const url = new URL(request.url, `http://${request.headers.host}`);

    if (url.pathname === "/health") {
      return sendJson(response, 200, {
        status: "ok",
        service: appName,
        environment: appEnv
      });
    }

    if (url.pathname === "/info") {
      return sendJson(response, 200, {
        service: appName,
        environment: appEnv,
        node: process.version
      });
    }

    if (url.pathname === "/") {
      return sendJson(response, 200, {
        message: "Your personal DevOps environment is running.",
        endpoints: ["/health", "/info"]
      });
    }

    return sendJson(response, 404, {
      error: "not_found"
    });
  });
}

function sendJson(response, statusCode, body) {
  response.writeHead(statusCode, {
    "content-type": "application/json; charset=utf-8"
  });
  response.end(`${JSON.stringify(body, null, 2)}\n`);
}

if (process.argv[1] && import.meta.url === pathToFileURL(process.argv[1]).href) {
  createServer().listen(port, () => {
    console.log(`${appName} listening on http://localhost:${port}`);
  });
}
