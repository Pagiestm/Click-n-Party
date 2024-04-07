document.addEventListener('DOMContentLoaded', () => {
    const comments = Array.from(document.querySelectorAll('.comment'));
    const loadMoreCommentsButton = document.getElementById('loadMoreComments');
    const loadingIndicator = document.getElementById('loadingIndicator');

    let currentCommentCount = comments.filter(comment => comment.style.display !== 'none').length;

    loadMoreCommentsButton.addEventListener('click', () => {
        loadingIndicator.style.display = 'block';

        const nextComments = comments.slice(currentCommentCount, currentCommentCount + 2);
        nextComments.forEach(comment => comment.style.display = 'block');
        currentCommentCount += nextComments.length;

        if (currentCommentCount >= comments.length) {
            loadMoreCommentsButton.style.display = 'none';
        }

        loadingIndicator.style.display = 'none';
    });
});