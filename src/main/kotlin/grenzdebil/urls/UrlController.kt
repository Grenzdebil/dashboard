package grenzdebil.urls

import grenzdebil.urls.model.Url
import org.springframework.web.bind.annotation.GetMapping
import org.springframework.web.bind.annotation.RestController

@RestController
class UrlController(val urlService: UrlService) {

    @GetMapping("/url_collection")
    fun getAll() = urlService.getAllUrls()

    @GetMapping("/test")
    fun test(): List<Url> = listOf(
        Url("/url_collection", listOf()),
        Url("google.de", listOf()),
        Url("https://www.google.de", listOf())
    )
}
