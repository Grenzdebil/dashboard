package grenzdebil.urls

import grenzdebil.generated.tables.references.URL
import grenzdebil.generated.tables.references.URL_TAG
import grenzdebil.generated.tables.references.URL_URL_TAG
import grenzdebil.urls.model.Url
import grenzdebil.urls.model.UrlTag
import org.jooq.DSLContext
import org.springframework.stereotype.Service
import org.springframework.transaction.annotation.Transactional

@Service
class UrlService(private val dsl: DSLContext) {

    @Throws(IllegalStateException::class)
    @Transactional
    fun create(url: Url) {
        val urlRecord = dsl.insertInto(URL)
            .set(URL.URL_, url.url)
            .returning(URL.ID)
            .fetchOne()

        val urlId = urlRecord?.id ?: checkNotNull(urlRecord?.id) { "Failed to insert URL" }

        url.tags.forEach { tag ->
            val tagRecord = dsl.insertInto(URL_TAG)
                .set(URL_TAG.NAME, tag.name)
                .onConflict(URL_TAG.NAME)
                .doNothing()
                .returning(URL_TAG.ID)
                .fetchOne()

            val tagId = tagRecord?.id ?: dsl.select(URL_TAG.ID)
                .from(URL_TAG)
                .where(URL_TAG.NAME.eq(tag.name))
                .fetchOne(URL_TAG.ID)

            dsl.insertInto(URL_URL_TAG)
                .set(URL_URL_TAG.URL_ID, urlId)
                .set(URL_URL_TAG.TAG_ID, tagId)
                .execute()
        }
    }

    fun getAllUrls(): List<Url> {
        return dsl.select(URL.ID, URL.URL_)
            .from(URL)
            .fetch()
            .map { record ->
                val url = record.get(URL.URL_) ?: "default_url" // Standardwert setzen
                val tags = dsl.select(URL_TAG.NAME)
                    .from(URL_TAG)
                    .join(URL_URL_TAG).on(URL_TAG.ID.eq(URL_URL_TAG.TAG_ID))
                    .where(URL_URL_TAG.URL_ID.eq(record.get(URL.ID)))
                    .fetch()
                    .map { UrlTag(it.get(URL_TAG.NAME) ?: "default_tag") }

                Url(url, tags)
            }
    }
}
