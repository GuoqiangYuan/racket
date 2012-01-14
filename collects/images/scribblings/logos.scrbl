#lang scribble/manual

@(require scribble/eval
          unstable/latent-contract/defthing
          (for-label images/logos
                     racket)
          images/logos)

@(define (author-email) "neil.toronto@gmail.com")

@title{Logos}
@author{@(author+email "Neil Toronto" (author-email))}

@defmodule[images/logos]

@(define logos-eval (make-base-eval))
@interaction-eval[#:eval logos-eval (require images/logos images/icons/style)]

@doc-apply[plt-logo]{
Returns the PLT logo, rendered on clear glass and blue metal by the ray tracer that renders icons.

A 256×256 (default-size) rendering is compiled into the @racketmodname[images/logos] module using @racket[compiled-bitmap], meaning that constructing the logo at that size and smaller is cheap.
In fact, constructing the logo at the default size is essentially free:
@interaction[#:eval logos-eval
                    (time (plt-logo))
                    (time (plt-logo 128))
                    (time (plt-logo 257))]
}

@doc-apply[planet-logo]{
Returns an unofficial PLaneT logo. This is used as the PLaneT icon when DrRacket downloads PLaneT packages.

As with the @racket[plt-logo], a default-size rendering is compiled into the @racketmodname[images/logos] module for performance reasons.
@interaction[#:eval logos-eval
                    (time (planet-logo))
                    (planet-logo (default-icon-height))]
}
