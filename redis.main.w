bring containers;
bring cloud;
bring expect;

pub class Redis {
  pub url: str?;
    new () {
      let image = "redis:latest";
      let container = new containers.Workload(
        image: image,
        name: "redis",
        port: 6379,
        public: true,
      );
      this.url = container.getPublicUrl();
    }
}

class Utils {
  extern "./redis.js" pub inflight static shell(cmd: str, args: Array<str>): str;
}

let redis = new Redis();

test "test 1" {
  let result = Utils.shell("docker", ["ps"]);
  log(result);
  log("1 {redis.url}");
  expect.equal("1", "1");
}

test "test 2" {
  let result = Utils.shell("docker", ["ps"]);
  log(result);
  log("2 {redis.url}");
  expect.equal("1", "1");
}