(import lambda-runtime :as lambda)

(var ctx {})

(defn initialise! []
  (set ctx {:from :init}))

(defn handler [{:ctx lambda-ctx :event event}]
  {:lambda-ctx lambda-ctx
   :event event
   :local-ctx ctx
   :env (os/environ)})

(defn main [_]
  (lambda/serve initialise! handler))
