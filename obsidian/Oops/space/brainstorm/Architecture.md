# Architecture
1. Define the Core Models

    Actors: Users, organizations, bots, etc.
    Activities: Create, Follow, Like, Announce (boost), etc.
    Objects: Notes (posts), Articles, Media, etc.
    Inbox/Outbox: Handling incoming and outgoing activities.

2. Implement Basic API Endpoints

    GET /.well-known/webfinger → Identity resolution.
    GET /users/{username} → Actor profile.
    POST /users/{username}/inbox → Receive federated messages.
    POST /users/{username}/outbox → Send messages.

3. Federation Basics

    Signature verification (HTTP Signatures for federated requests).
    Delivery mechanism (POSTing activities to followers' inboxes).
    Object persistence (Store Activities, Actors, and Objects in DB).

4. Social Features

    Following system (Followers collection).
    Likes, boosts, replies.
    Threaded conversations.

5. Media Handling

    Uploads (images, videos, attachments).
    Metadata extraction (alt text, previews).

6. Moderation & Security

    Rate limiting & spam filtering.
    Blocking & muting.
    Content moderation tools.

7. Web UI & APIs

    HTMX frontend for real-time updates.
    ActivityPub client compatibility (e.g., Mastodon, Pleroma).